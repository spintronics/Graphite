package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type ICatalogService interface {
	types.CrudService[models.Catalog]
}

type CatalogService struct {
	DB *gorm.DB
}

func (service *CatalogService) GetAll(paging *types.PagingConfig) []models.Catalog {
	var Catalogs []models.Catalog
	service.DB.Scopes(util.Paginate(paging)).Find(&Catalogs)
	return Catalogs
}

func (service *CatalogService) GetByID(id string) models.Catalog {
	var Catalog models.Catalog
	service.DB.First(&Catalog, id)
	return Catalog
}

func (service *CatalogService) Create(Catalog models.Catalog) models.Catalog {
	service.DB.Create(&Catalog)
	return Catalog
}

func (service *CatalogService) Update(Catalog models.Catalog) models.Catalog {
	service.DB.Save(&Catalog)
	return Catalog
}

func (service *CatalogService) Delete(id string) error {
	var Catalog models.Catalog
	tx := service.DB.First(&Catalog, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&Catalog)
	return nil
}

func NewCatalogService(db *gorm.DB) *CatalogService {
	return &CatalogService{db}
}
