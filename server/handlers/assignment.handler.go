package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterAssignmentHandlers(rg *gin.RouterGroup) {
	assignment := rg.Group("/assignment")

	assignment.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		assignmentService := c.MustGet("assignmentService").(*services.AssignmentService)
		assignments := assignmentService.GetAll(&paging)
		c.JSON(200, assignments)
	})

	assignment.GET("/:id", func(c *gin.Context) {
		assignmentService := c.MustGet("assignmentService").(*services.AssignmentService)
		assignment := assignmentService.GetByID(c.Param("id"))
		c.JSON(200, assignment)
	})

	assignment.POST("", func(c *gin.Context) {
		var assignment models.Assignment
		c.BindJSON(&assignment)
		assignmentService := c.MustGet("assignmentService").(*services.AssignmentService)
		assignment = assignmentService.Create(assignment)
		c.JSON(200, assignment)
	})

	assignment.PUT("/:id", func(c *gin.Context) {
		var assignment models.Assignment
		c.BindJSON(&assignment)
		assignmentService := c.MustGet("assignmentService").(*services.AssignmentService)
		assignment = assignmentService.Update(assignment)
		c.JSON(200, assignment)
	})

	assignment.DELETE("/:id", func(c *gin.Context) {
		assignmentService := c.MustGet("assignmentService").(*services.AssignmentService)
		err := assignmentService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
