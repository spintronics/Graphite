package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterInstructorHandlers(rg *gin.RouterGroup) {
	instructor := rg.Group("/instructor")

	instructor.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		instructors := instructorService.GetAll(&paging)
		c.JSON(200, instructors)
	})

	instructor.GET("/:id", func(c *gin.Context) {
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		instructor := instructorService.GetByID(c.Param("id"))
		c.JSON(200, instructor)
	})

	instructor.POST("", func(c *gin.Context) {
		var instructor models.Instructor
		c.BindJSON(&instructor)
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		instructor = instructorService.Create(instructor)
		c.JSON(200, instructor)
	})

	instructor.PUT("/:id", func(c *gin.Context) {
		var instructor models.Instructor
		c.BindJSON(&instructor)
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		instructor = instructorService.Update(instructor)
		c.JSON(200, instructor)
	})

	instructor.DELETE("/:id", func(c *gin.Context) {
		instructorService := c.MustGet("instructorService").(*services.InstructorService)
		err := instructorService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
