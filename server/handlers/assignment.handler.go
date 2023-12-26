package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"github.com/spintronics/graphite/server/util"
)

func getService(c *gin.Context) *services.AssignmentService {
	return c.MustGet("assignmentService").(*services.AssignmentService)
}

func RegisterAssignmentHandlers(rg *gin.RouterGroup) {
	assignment := rg.Group("/assignment")

	assignment.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		assignmentService := getService(c)
		var assignments []models.Assignment
		assignmentService.GetAll(&paging, &assignments)
		c.JSON(200, assignments)
	})

	assignment.GET("/:id", func(c *gin.Context) {
		assignmentService := getService(c)
		var assignment models.Assignment
		assignmentService.GetByID(c.Param("id"), &assignment)
		c.JSON(200, assignment)
	})

	assignment.POST("", func(c *gin.Context) {
		var assignment models.Assignment
		c.BindJSON(&assignment)
		assignmentService := getService(c)
		assignmentService.Create(&assignment)
		c.JSON(200, assignment)
	})

	assignment.PUT("/:id", func(c *gin.Context) {
		var assignment models.Assignment
		c.BindJSON(&assignment)
		assignmentService := getService(c)
		assignmentService.Update(&assignment)
		c.JSON(200, assignment)
	})

	assignment.DELETE("/:id", func(c *gin.Context) {
		assignmentService := getService(c)
		err := assignmentService.Delete(c.Param("id"), &models.Assignment{})
		if err != nil {
			c.JSON(400, err)
		} else {
			c.Status(200)
		}
	})

	assignment.GET("/count", func(c *gin.Context) {
		assignmentService := getService(c)
		var assignment models.Assignment
		var count int64
		assignmentService.Count(&assignment, &count)
		c.JSON(200, count)
	})

}
