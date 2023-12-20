package models

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Catalog struct {
	gorm.Model
	ID          string   `json:"id" gorm:"primaryKey"`
	Name        string   `json:"name"`
	Description string   `json:"description"`
	Courses     []Course `json:"courses" gorm:"many2many:catalog_courses;"`
}

func (a *Catalog) BeforeCreate(tx *gorm.DB) (err error) {
	a.ID = uuid.NewString()
	return
}
