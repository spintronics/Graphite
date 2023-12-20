package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type IUserService interface {
	types.CrudService[models.User]
}

type UserService struct {
	DB *gorm.DB
}

func (service *UserService) GetAll(paging *types.PagingConfig) []models.User {
	var Users []models.User
	service.DB.Scopes(util.Paginate(paging)).Find(&Users)
	return Users
}

func (service *UserService) GetByID(id string) models.User {
	var User models.User
	service.DB.First(&User, id)
	return User
}

func (service *UserService) Create(User models.User) models.User {
	service.DB.Create(&User)
	return User
}

func (service *UserService) Update(User models.User) models.User {
	service.DB.Save(&User)
	return User
}

func (service *UserService) Delete(id string) error {
	var User models.User
	tx := service.DB.First(&User, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&User)
	return nil
}

func NewUserService(db *gorm.DB) *UserService {
	return &UserService{db}
}
