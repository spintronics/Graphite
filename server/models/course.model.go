package models

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Course struct {
	gorm.Model
	ID          string       `json:"id" gorm:"primaryKey"`
	Name        string       `json:"name"`
	Description string       `json:"description"`
	Assignments []Assignment `json:"assignments" gorm:"many2many:course_assignments;"`
}

func (a *Course) BeforeCreate(tx *gorm.DB) (err error) {
	a.ID = uuid.NewString()
	return
}
