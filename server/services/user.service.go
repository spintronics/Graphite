package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)


type UserService struct {
	DatabaseService[models.User]
}

func NewUserService(db *gorm.DB) *UserService {
	return &UserService{
		DatabaseService[models.User]{
			DB: db,
		},
	}
}
