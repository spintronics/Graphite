package services

import (
	"github.com/spintronics/graphite/server/models"
	types "github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type IAssignmentService interface {
	types.CrudService[models.Assignment]
}

type AssignmentService struct {
	DB *gorm.DB
}

func (service *AssignmentService) GetAll(paging *types.PagingConfig) []models.Assignment {
	var Assignments []models.Assignment
	service.DB.Scopes(util.Paginate(paging)).Find(&Assignments)
	return Assignments
}

func (service *AssignmentService) GetByID(id string) models.Assignment {
	var Assignment models.Assignment
	service.DB.First(&Assignment, id)
	return Assignment
}

func (service *AssignmentService) Create(Assignment models.Assignment) models.Assignment {
	service.DB.Create(&Assignment)
	return Assignment
}

func (service *AssignmentService) Update(Assignment models.Assignment) models.Assignment {
	service.DB.Save(&Assignment)
	return Assignment
}

func (service *AssignmentService) Delete(id string) error {
	var Assignment models.Assignment
	tx := service.DB.First(&Assignment, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&Assignment)
	return nil
}

func NewAssignmentService(db *gorm.DB) *AssignmentService {
	return &AssignmentService{db}
}
