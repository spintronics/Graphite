package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)

type CourseService struct {
	DatabaseService[models.Course]
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
	return &CourseService{
		DatabaseService[models.Course]{
			DB: db,
		},
	}
}
