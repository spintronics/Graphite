package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	util "github.com/spintronics/graphite/server/util"
	"gorm.io/gorm"
)

type ISessionService interface {
	types.CrudService[models.Session]
}

type SessionService struct {
	DB *gorm.DB
}

func (service *SessionService) GetAll(paging *types.PagingConfig) []models.Session {
	var Sessions []models.Session
	service.DB.Scopes(util.Paginate(paging)).Find(&Sessions)
	return Sessions
}

func (service *SessionService) GetByID(id string) models.Session {
	var Session models.Session
	service.DB.First(&Session, id)
	return Session
}

func (service *SessionService) Create(Session models.Session) models.Session {
	service.DB.Create(&Session)
	return Session
}

func (service *SessionService) Update(Session models.Session) models.Session {
	service.DB.Save(&Session)
	return Session
}

func (service *SessionService) Delete(id string) error {
	var Session models.Session
	tx := service.DB.First(&Session, id)

	if tx.Error != nil {
		return tx.Error
	}

	service.DB.Delete(&Session)
	return nil
}

func NewSessionService(db *gorm.DB) *SessionService {
	return &SessionService{db}
}
