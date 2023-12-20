package models

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Instructor struct {
	ID      string   `json:"id" gorm:"primaryKey"`
	User    User     `json:"user"`
	UserID  string   `json:"-"`
	Courses []Course `json:"courses" gorm:"many2many:instructor_courses;"`
}

func (a *Instructor) BeforeCreate(tx *gorm.DB) (err error) {
	a.ID = uuid.NewString()
	return
}
