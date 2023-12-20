package util

import (
	"net/http"
	"strconv"

	"github.com/spintronics/graphite/server/types"
	"gorm.io/gorm"
)

func GetPagingConfig(req *http.Request) types.PagingConfig {
	query := req.URL.Query()
	pageSize := 10
	page := 1

	if query.Has("pageSize") {
		pageSize, _ = strconv.Atoi(query.Get("pageSize"))
	}
	if query.Has("page") {
		page, _ = strconv.Atoi(query.Get("page"))
	}

	switch {
	case pageSize <= 0:
		pageSize = 10
	case pageSize > 100:
		pageSize = 100
	}

	return types.PagingConfig{
		PageSize: pageSize,
		Page:     page,
	}
}

func Paginate(config *types.PagingConfig) func(db *gorm.DB) *gorm.DB {
	return func(db *gorm.DB) *gorm.DB {
		offset := config.PageSize * (config.Page - 1)

		return db.Offset(offset).Limit(config.PageSize)
	}
}
