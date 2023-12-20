package models

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Session struct {
	gorm.Model
	ID         string `json:"id" gorm:"primaryKey"`
	UserID     string `json:"-"`
	User       User   `json:"user"`
	Token      string `json:"token"`
	Expiration string `json:"expiration"`
}

func (a *Session) BeforeCreate(tx *gorm.DB) (err error) {
	a.ID = uuid.NewString()
	return
}
