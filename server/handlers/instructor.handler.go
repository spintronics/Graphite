package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"github.com/spintronics/graphite/server/util"
)

func RegisterInstructorHandlers(rg *gin.RouterGroup) {
	instructor := rg.Group("/instructor")

	instructor.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		var instructors []models.Instructor
		instructorService.GetAll(&paging, &instructors)
		c.JSON(200, instructors)
	})

	instructor.GET("/:id", func(c *gin.Context) {
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		var instructor models.Instructor
		instructorService.GetByID(c.Param("id"), &instructor)
		c.JSON(200, instructor)
	})

	instructor.POST("", func(c *gin.Context) {
		var instructor models.Instructor
		c.BindJSON(&instructor)
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		instructorService.Create(&instructor)
		c.JSON(200, instructor)
	})

	instructor.PUT("/:id", func(c *gin.Context) {
		var instructor models.Instructor
		c.BindJSON(&instructor)
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		instructorService.Update(&instructor)
		c.JSON(200, instructor)
	})

	instructor.DELETE("/:id", func(c *gin.Context) {
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		err := instructorService.Delete(c.Param("id"), &models.Instructor{})
		if err != nil {
			c.JSON(400, err)
		} else {
			c.Status(200)
		}
	})

}
