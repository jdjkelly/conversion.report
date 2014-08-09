package main

import (
	"encoding/json"
	"log"
	"net/http"
	"time"

	"github.com/go-martini/martini"
	"github.com/jinzhu/gorm"
	"github.com/martini-contrib/cors"

	_ "github.com/lib/pq"
)

type Conversion struct {
	Id        int64
	TrackerId string `sql:"size:255"`
	Referer   string `sql:"size:255"`
	UserAgent string `sql:"size:255"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt time.Time
}

func main() {
	db, err := gorm.Open("postgres", "user=conversion_report dbname=conversion_report sslmode=disable")
	if err != nil {
		log.Fatal(err)
	} else {
		db.AutoMigrate(Conversion{})
	}

	m := martini.Classic()

	m.Map(db)

	m.Use(cors.Allow(&cors.Options{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"POST"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	m.Get("/api/v1/conversions", func(res http.ResponseWriter, req *http.Request) string {
		return "Hello world"
	})

	m.Post("/api/v1/conversions", func(res http.ResponseWriter, req *http.Request) {
		decoder := json.NewDecoder(req.Body)
		var c Conversion
		err := decoder.Decode(&c)
		if err != nil {
			log.Fatal(err)
		} else {
			//
			// Let's get to fucking work
			c.Referer = req.Referer()
			c.UserAgent = req.UserAgent()
			db.Create(&c)
		}
	})

	m.Run()
}
