package handlers

import (
	"github.com/gin-gonic/gin"
	models "github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	util "github.com/spintronics/graphite/server/util"
)

func RegisterCatalogHandlers(rg *gin.RouterGroup) {
	catalog := rg.Group("/catalog")

	catalog.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		catalogs := catalogService.GetAll(&paging)
		c.JSON(200, catalogs)
	})

	catalog.GET("/:id", func(c *gin.Context) {
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		catalog := catalogService.GetByID(c.Param("id"))
		c.JSON(200, catalog)
	})

	catalog.POST("", func(c *gin.Context) {
		var catalog models.Catalog
		c.BindJSON(&catalog)
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		catalog = catalogService.Create(catalog)
		c.JSON(200, catalog)
	})

	catalog.PUT("/:id", func(c *gin.Context) {
		var catalog models.Catalog
		c.BindJSON(&catalog)
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		catalog = catalogService.Update(catalog)
		c.JSON(200, catalog)
	})

	catalog.DELETE("/:id", func(c *gin.Context) {
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		err := catalogService.Delete(c.Param("id"))
		if err != nil {
			c.JSON(400, err)
		} else {
			c.JSON(200, nil)
		}
	})

}
