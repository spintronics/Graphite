package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)

type InstructorService struct {
	DatabaseService[models.Instructor]
}

func NewInstructorService(db *gorm.DB) *InstructorService {
	return &InstructorService{
		DatabaseService[models.Instructor]{
			DB: db,
		},
	}
}
