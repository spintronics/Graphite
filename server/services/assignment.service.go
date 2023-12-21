package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)

type AssignmentService struct {
	DatabaseService[models.Assignment]
}

func NewAssignmentService(db *gorm.DB) *AssignmentService {
	return &AssignmentService{
		DatabaseService[models.Assignment]{
			DB: db,
		},
	}
}
