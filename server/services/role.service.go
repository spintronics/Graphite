package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type IRoleService interface {
	types.CrudService[models.Role]
}

type RoleService struct {
	DB *gorm.DB
}

func (service *RoleService) GetAll(paging *types.PagingConfig) []models.Role {
	var Roles []models.Role
	service.DB.Scopes(util.Paginate(paging)).Find(&Roles)
	return Roles
}

func (service *RoleService) GetByID(id string) models.Role {
	var Role models.Role
	service.DB.First(&Role, id)
	return Role
}

func (service *RoleService) Create(Role models.Role) models.Role {
	service.DB.Create(&Role)
	return Role
}

func (service *RoleService) Update(Role models.Role) models.Role {
	service.DB.Save(&Role)
	return Role
}

func (service *RoleService) Delete(id string) error {
	var Role models.Role
	tx := service.DB.First(&Role, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&Role)
	return nil
}

func NewRoleService(db *gorm.DB) *RoleService {
	return &RoleService{db}
}
