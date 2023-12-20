package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type ICourseService interface {
	types.CrudService[models.Course]
	AddAssignment(string, string) error
	RemoveAssignment(string, string) error
}

type CourseService struct {
	DB *gorm.DB
}

func (service *CourseService) GetAll(paging *types.PagingConfig) []models.Course {
	var courses []models.Course
	service.DB.Scopes(util.Paginate(paging)).Find(&courses)
	return courses
}

func (service *CourseService) GetByID(id string) models.Course {
	var course models.Course
	service.DB.First(&course, id)
	return course
}

func (service *CourseService) Create(course models.Course) models.Course {
	service.DB.Create(&course)
	return course
}

func (service *CourseService) Update(course models.Course) models.Course {
	service.DB.Save(&course)
	return course
}

func (service *CourseService) Delete(id string) error {
	var course models.Course
	tx := service.DB.First(&course, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&course)
	return nil
}

func (service *CourseService) AddAssignment(courseID string, assignmentID string) error {
	var course models.Course
	var assignment models.Assignment

	tx := service.DB.First(&course, courseID)
	if tx.Error != nil {
		return tx.Error
	}

	tx = service.DB.First(&assignment, assignmentID)
	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Model(&course).Association("Assignments").Append(&assignment)
	return nil
}

func (service *CourseService) RemoveAssignment(courseID string, assignmentID string) error {
	var course models.Course
	var assignment models.Assignment

	tx := service.DB.First(&course, courseID)
	if tx.Error != nil {
		return tx.Error
	}

	tx = service.DB.First(&assignment, assignmentID)
	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Model(&course).Association("Assignments").Delete(&assignment)
	return nil
}

func NewCourseService(db *gorm.DB) *CourseService {
	return &CourseService{db}
}
