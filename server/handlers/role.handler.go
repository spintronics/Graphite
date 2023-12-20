package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterRoleHandlers(rg *gin.RouterGroup) {
	role := rg.Group("/role")

	role.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		roleService := c.MustGet("roleService").(*services.RoleService)
		roles := roleService.GetAll(&paging)
		c.JSON(200, roles)
	})

	role.GET("/:id", func(c *gin.Context) {
		roleService := c.MustGet("roleService").(*services.RoleService)
		role := roleService.GetByID(c.Param("id"))
		c.JSON(200, role)
	})

	role.POST("", func(c *gin.Context) {
		var role models.Role
		c.BindJSON(&role)
		roleService := c.MustGet("roleService").(*services.RoleService)
		role = roleService.Create(role)
		c.JSON(200, role)
	})

	role.PUT("/:id", func(c *gin.Context) {
		var role models.Role
		c.BindJSON(&role)
		roleService := c.MustGet("roleService").(*services.RoleService)
		role = roleService.Update(role)
		c.JSON(200, role)
	})

	role.DELETE("/:id", func(c *gin.Context) {
		roleService := c.MustGet("roleService").(*services.RoleService)
		err := roleService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
