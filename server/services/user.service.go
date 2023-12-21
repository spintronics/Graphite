package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	"gorm.io/gorm"
)

type IUserService interface {
	types.CrudService[models.User]
}

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
