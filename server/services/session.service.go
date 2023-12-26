package services

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/gorm"
)

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
