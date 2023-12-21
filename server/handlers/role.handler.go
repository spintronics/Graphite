package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"github.com/spintronics/graphite/server/util"
)

func RegisterRoleHandlers(rg *gin.RouterGroup) {
	role := rg.Group("/role")

	role.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		roleService := c.MustGet("roleService").(*services.RoleService)
		var roles []models.Role
		roleService.GetAll(&paging, &roles)
		c.JSON(200, roles)
	})

	role.GET("/:id", func(c *gin.Context) {
		roleService := c.MustGet("roleService").(*services.RoleService)
		var role models.Role
		roleService.GetByID(c.Param("id"), &role)
		c.JSON(200, role)
	})

	role.POST("", func(c *gin.Context) {
		var role models.Role
		c.BindJSON(&role)
		roleService := c.MustGet("roleService").(*services.RoleService)
		roleService.Create(&role)
		c.JSON(200, role)
	})

	role.PUT("/:id", func(c *gin.Context) {
		var role models.Role
		c.BindJSON(&role)
		roleService := c.MustGet("roleService").(*services.RoleService)
		roleService.Update(&role)
		c.JSON(200, role)
	})

	role.DELETE("/:id", func(c *gin.Context) {
		roleService := c.MustGet("roleService").(*services.RoleService)
		err := roleService.Delete(c.Param("id"), &models.Role{})
		if err != nil {
			c.JSON(400, err)
		} else {
			c.Status(200)
		}
	})

}
