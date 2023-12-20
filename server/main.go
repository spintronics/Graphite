package main

import (
	"net/http"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	handlers "github.com/spintronics/graphite/server/handlers"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"gorm.io/driver/postgres"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	// Initialize database
	db, err := gorm.Open(postgres.Open("host=localhost user=postgres password=postgres dbname=graphite port=5432 sslmode=disable"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	// Migrate the schema
	db.AutoMigrate(&models.Course{}, &models.Assignment{}, &models.Catalog{}, &models.User{}, &models.Instructor{}, &models.Role{}, &models.Session{})

	router := gin.Default()

	// Serve static files
	router.Use(func(ctx *gin.Context) {
		if strings.HasPrefix(ctx.Request.URL.Path, "/api") {
			ctx.Next()
		} else {
			if ctx.Request.URL.Path == "/" {
				ctx.File("../client/build/web/index.html")
				return
			}
			// serve static file
			// check if file exists
			info, err := os.Stat("../client/build/web" + ctx.Request.URL.Path)
			if err != nil || info.IsDir() {
				// send 404
				ctx.AbortWithStatus(http.StatusNotFound)
				return
			}
			ctx.File("../client/build/web" + ctx.Request.URL.Path)
		}
	})

	catalogService := services.NewCatalogService(db)
	courseService := services.NewCourseService(db)
	assignmentService := services.NewAssignmentService(db)
	userService := services.NewUserService(db)
	instructorService := services.NewInstructorService(db)
	roleService := services.NewRoleService(db)
	sessionService := services.NewSessionService(db)

	// Inject services into context
	router.Use(func(ctx *gin.Context) {
		ctx.Set("catalogService", catalogService)
		ctx.Set("courseService", courseService)
		ctx.Set("assignmentService", assignmentService)
		ctx.Set("userService", userService)
		ctx.Set("instructorService", instructorService)
		ctx.Set("roleService", roleService)
		ctx.Set("sessionService", sessionService)

		ctx.Next()
	})

	var dbMap = make(map[string]*gorm.DB)
	// use a different database if user is testing
	// this must occur after the services are injected into the context
	router.Use(func(ctx *gin.Context) {
		// if user is testing, use a different database
		testDBId := ctx.GetHeader("X-Test-DB")
		if testDBId != "" {
			db := dbMap[testDBId]
			if db == nil {
				panic("failed to connect database")
			}
			ctx.Set("catalogService", services.NewCatalogService(db))
			ctx.Set("courseService", services.NewCourseService(db))
			ctx.Set("assignmentService", services.NewAssignmentService(db))
			ctx.Set("userService", services.NewUserService(db))
			ctx.Set("instructorService", services.NewInstructorService(db))
			ctx.Set("roleService", services.NewRoleService(db))
			ctx.Set("sessionService", services.NewSessionService(db))
		}

		ctx.Next()
	})

	api := router.Group("/api")
	v1 := api.Group("/v1")

	// Initialize handlers
	handlers.RegisterCourseHandlers(v1)
	handlers.RegisterAssignmentHandlers(v1)
	handlers.RegisterCatalogHandlers(v1)
	handlers.RegisterUserHandlers(v1)
	handlers.RegisterInstructorHandlers(v1)
	handlers.RegisterRoleHandlers(v1)
	handlers.RegisterSessionHandlers(v1)

	v1.GET("/db", func(ctx *gin.Context) {
		// create a test database
		id := uuid.NewString()
		db, err := gorm.Open(sqlite.Open("file::memory:"), &gorm.Config{})

		if err != nil {
			panic("failed to connect database")
		}

		db.AutoMigrate(&models.Course{}, &models.Assignment{}, &models.Catalog{}, &models.User{}, &models.Instructor{}, &models.Role{}, &models.Session{})

		dbMap[id] = db

		ctx.String(http.StatusOK, id)
	})

	v1.DELETE("/db/:id", func(ctx *gin.Context) {
		// delete a test database
		id := ctx.Param("id")
		db := dbMap[id]
		if db != nil {
			delete(dbMap, id)
			ctx.String(http.StatusOK, id)
		} else {
			ctx.String(http.StatusNotFound, id)
		}
	})

	router.Run(":5000")
}
