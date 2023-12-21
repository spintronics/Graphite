package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"github.com/spintronics/graphite/server/util"
)

func RegisterCourseHandlers(rg *gin.RouterGroup) {
	course := rg.Group("/course")

	course.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		courseService := c.MustGet("courseService").(*services.CourseService)
		var courses []models.Course
		courseService.GetAll(&paging, &courses)
		c.JSON(200, courses)
	})

	course.GET("/:id", func(c *gin.Context) {
		courseService := c.MustGet("courseService").(*services.CourseService)
		var course models.Course
		courseService.GetByID(c.Param("id"), &course)
		c.JSON(200, course)
	})

	course.POST("", func(c *gin.Context) {
		var course models.Course
		c.BindJSON(&course)
		courseService := c.MustGet("courseService").(*services.CourseService)
		courseService.Create(&course)
		c.JSON(200, course)
	})

	course.PUT("/:id", func(c *gin.Context) {
		var course models.Course
		c.BindJSON(&course)
		courseService := c.MustGet("courseService").(*services.CourseService)
		courseService.Update(&course)
		c.JSON(200, course)
	})

	course.DELETE("/:id", func(c *gin.Context) {
		courseService := c.MustGet("courseService").(*services.CourseService)
		err := courseService.Delete(c.Param("id"), &models.Course{})
		if err != nil {
			c.JSON(400, err)
		} else {
			c.Status(200)
		}
	})

}
