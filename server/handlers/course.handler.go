package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterCourseHandlers(rg *gin.RouterGroup) {
	course := rg.Group("/course")

	course.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		courseService := c.MustGet("courseService").(*services.CourseService)
		courses := courseService.GetAll(&paging)
		c.JSON(200, courses)
	})

	course.GET("/:id", func(c *gin.Context) {
		courseService := c.MustGet("courseService").(*services.CourseService)
		course := courseService.GetByID(c.Param("id"))
		c.JSON(200, course)
	})

	course.POST("", func(c *gin.Context) {
		var course models.Course
		c.BindJSON(&course)
		courseService := c.MustGet("courseService").(*services.CourseService)
		course = courseService.Create(course)
		c.JSON(200, course)
	})

	course.PUT("/:id", func(c *gin.Context) {
		var course models.Course
		c.BindJSON(&course)
		courseService := c.MustGet("courseService").(*services.CourseService)
		course = courseService.Update(course)
		c.JSON(200, course)
	})

	course.DELETE("/:id", func(c *gin.Context) {
		courseService := c.MustGet("courseService").(*services.CourseService)

		err := courseService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
