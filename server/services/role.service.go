package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	"gorm.io/gorm"
)

type IRoleService interface {
	types.CrudService[models.Role]
}

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
