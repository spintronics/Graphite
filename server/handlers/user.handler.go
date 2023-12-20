package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterUserHandlers(rg *gin.RouterGroup) {
	user := rg.Group("/user")

	user.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		userService := c.MustGet("userService").(*services.UserService)
		users := userService.GetAll(&paging)
		c.JSON(200, users)
	})

	user.GET("/:id", func(c *gin.Context) {
		userService := c.MustGet("userService").(*services.UserService)
		user := userService.GetByID(c.Param("id"))
		c.JSON(200, user)
	})

	user.POST("", func(c *gin.Context) {
		var user models.User
		c.BindJSON(&user)
		userService := c.MustGet("userService").(*services.UserService)
		user = userService.Create(user)
		c.JSON(200, user)
	})

	user.PUT("/:id", func(c *gin.Context) {
		var user models.User
		c.BindJSON(&user)
		userService := c.MustGet("userService").(*services.UserService)
		user = userService.Update(user)
		c.JSON(200, user)
	})

	user.DELETE("/:id", func(c *gin.Context) {
		userService := c.MustGet("userService").(*services.UserService)
		err := userService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
