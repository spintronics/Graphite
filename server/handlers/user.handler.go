package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"github.com/spintronics/graphite/server/util"
)

func RegisterUserHandlers(rg *gin.RouterGroup) {
	user := rg.Group("/user")

	user.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		userService := c.MustGet("userService").(*services.UserService)
		var users []models.User
		userService.GetAll(&paging, &users)
		c.JSON(200, users)
	})

	user.GET("/:id", func(c *gin.Context) {
		userService := c.MustGet("userService").(*services.UserService)
		var user models.User
		userService.GetByID(c.Param("id"), &user)
		c.JSON(200, user)
	})

	user.POST("", func(c *gin.Context) {
		var user models.User
		c.BindJSON(&user)
		userService := c.MustGet("userService").(*services.UserService)
		userService.Create(&user)
		c.JSON(200, user)
	})

	user.PUT("/:id", func(c *gin.Context) {
		var user models.User
		c.BindJSON(&user)
		userService := c.MustGet("userService").(*services.UserService)
		userService.Update(&user)
		c.JSON(200, user)
	})

	user.DELETE("/:id", func(c *gin.Context) {
		userService := c.MustGet("userService").(*services.UserService)
		err := userService.Delete(c.Param("id"), &models.User{})
		if err != nil {
			c.JSON(400, err)
		} else {
			c.Status(200)
		}
	})

}
