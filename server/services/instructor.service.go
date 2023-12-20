package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type IInstructorService interface {
	types.CrudService[models.Instructor]
}

type InstructorService struct {
	DB *gorm.DB
}

func (service *InstructorService) GetAll(paging *types.PagingConfig) []models.Instructor {
	var Instructors []models.Instructor
	service.DB.Scopes(util.Paginate(paging)).Find(&Instructors)
	return Instructors
}

func (service *InstructorService) GetByID(id string) models.Instructor {
	var Instructor models.Instructor
	service.DB.First(&Instructor, id)
	return Instructor
}

func (service *InstructorService) Create(Instructor models.Instructor) models.Instructor {
	service.DB.Create(&Instructor)
	return Instructor
}

func (service *InstructorService) Update(Instructor models.Instructor) models.Instructor {
	service.DB.Save(&Instructor)
	return Instructor
}

func (service *InstructorService) Delete(id string) error {
	var Instructor models.Instructor
	tx := service.DB.First(&Instructor, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&Instructor)
	return nil
}

func NewInstructorService(db *gorm.DB) *InstructorService {
	return &InstructorService{db}
}
