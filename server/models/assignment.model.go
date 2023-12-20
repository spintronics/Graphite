package models

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Assignment struct {
	gorm.Model
	ID           string `json:"id" gorm:"primaryKey"`
	Name         string `json:"name"`
	Description  string `json:"description"`
	SoftDeadline string `json:"soft_deadline"`
	HardDeadline string `json:"hard_deadline"`
}

func (a *Assignment) BeforeCreate(tx *gorm.DB) (err error) {
	a.ID = uuid.NewString()
	return
}
