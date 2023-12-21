package services

import (
	"github.com/spintronics/graphite/server/models"
	"github.com/spintronics/graphite/server/types"
	"gorm.io/gorm"
)

type ISessionService interface {
	types.CrudService[models.Session]
}

type SessionService struct {
	DatabaseService[models.Session]
}

func NewSessionService(db *gorm.DB) *SessionService {
	return &SessionService{
		DatabaseService[models.Session]{
			DB: db,
		},
	}
}
