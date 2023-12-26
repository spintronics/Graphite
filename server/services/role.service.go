package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)

type RoleService struct {
	DatabaseService[models.Role]
}

func NewRoleService(db *gorm.DB) *RoleService {
	return &RoleService{
		DatabaseService[models.Role]{
			DB: db,
		},
	}
}
