package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterSessionHandlers(rg *gin.RouterGroup) {
	session := rg.Group("/session")

	session.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		sessionService := c.MustGet("sessionService").(*services.SessionService)
		sessions := sessionService.GetAll(&paging)
		c.JSON(200, sessions)
	})

	session.GET("/:id", func(c *gin.Context) {
		sessionService := c.MustGet("sessionService").(*services.SessionService)
		session := sessionService.GetByID(c.Param("id"))
		c.JSON(200, session)
	})

	session.POST("", func(c *gin.Context) {
		var session models.Session
		c.BindJSON(&session)
		sessionService := c.MustGet("sessionService").(*services.SessionService)
		session = sessionService.Create(session)
		c.JSON(200, session)
	})

	session.PUT("/:id", func(c *gin.Context) {
		var session models.Session
		c.BindJSON(&session)
		sessionService := c.MustGet("sessionService").(*services.SessionService)
		session = sessionService.Update(session)
		c.JSON(200, session)
	})

	session.DELETE("/:id", func(c *gin.Context) {
		sessionService := c.MustGet("sessionService").(*services.SessionService)
		err := sessionService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
