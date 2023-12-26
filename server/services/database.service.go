package services

import (
	types "github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type DatabaseService[M any] struct {
	DB    *gorm.DB
	Model M
}

func (service *DatabaseService[M]) GetAll(paging *types.PagingConfig, models *[]M) {
	service.DB.Scopes(util.Paginate(paging)).Find(&models)
}

func (service *DatabaseService[M]) GetByID(id string, model *M) {
	service.DB.First(&model, "id = ?", id)
}

func (service *DatabaseService[M]) Create(model *M) {
	service.DB.Create(model)
}

func (service *DatabaseService[M]) Update(model *M) {
	service.DB.Save(model)
}

func (service *DatabaseService[M]) Count(model *M, count *int64) {
	service.DB.Model(model).Count(count)
}

func (service *DatabaseService[M]) Delete(id string, model *M) error {
	// tx := service.DB.First(&model, "id = ?", id)

	// if tx.Error != nil {
	// 	return tx.Error
	// }

	service.DB.Delete(&model, "id = ?", id)
	return nil
}
