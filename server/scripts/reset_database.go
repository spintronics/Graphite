package main

import (
	"github.com/spintronics/graphite/server/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func main() {
	// Initialize database
	db, err := gorm.Open(postgres.Open("host=localhost user=postgres password=postgres port=5432 sslmode=disable"), &gorm.Config{})
	// db, err := gorm.Open(postgres.Open("host=localhost user=postgres password=postgres dbname=graphite port=5432 sslmode=disable"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	// drop database

	db.Exec("DROP DATABASE graphite;")
	db.Exec("CREATE DATABASE graphite;")

	// Migrate the schema

	db.AutoMigrate(&models.Course{})

}
