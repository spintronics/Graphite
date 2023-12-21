package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)

type CatalogService struct {
	DatabaseService[models.Catalog]
}

func NewCatalogService(db *gorm.DB) *CatalogService {
	return &CatalogService{
		DatabaseService[models.Catalog]{
			DB: db,
		},
	}
}
