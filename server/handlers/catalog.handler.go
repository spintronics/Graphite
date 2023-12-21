package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/spintronics/graphite/server/models"
	services "github.com/spintronics/graphite/server/services"
	"github.com/spintronics/graphite/server/util"
)

func RegisterCatalogHandlers(rg *gin.RouterGroup) {
	catalog := rg.Group("/catalog")

	catalog.GET("", func(c *gin.Context) {
		paging := util.GetPagingConfig(c.Request)
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		var catalogs []models.Catalog
		catalogService.GetAll(&paging, &catalogs)
		c.JSON(200, catalogs)
	})

	catalog.GET("/:id", func(c *gin.Context) {
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		var catalog models.Catalog
		catalogService.GetByID(c.Param("id"), &catalog)
		c.JSON(200, catalog)
	})

	catalog.POST("", func(c *gin.Context) {
		var catalog models.Catalog
		c.BindJSON(&catalog)
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		catalogService.Create(&catalog)
		c.JSON(200, catalog)
	})

	catalog.PUT("/:id", func(c *gin.Context) {
		var catalog models.Catalog
		c.BindJSON(&catalog)
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		catalogService.Update(&catalog)
		c.JSON(200, catalog)
	})

	catalog.DELETE("/:id", func(c *gin.Context) {
		catalogService := c.MustGet("catalogService").(*services.CatalogService)
		err := catalogService.Delete(c.Param("id"), &models.Catalog{})
		if err != nil {
			c.JSON(400, err)
		} else {
			c.Status(200)
		}
	})

}
