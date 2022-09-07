package main

import (
	"fmt"
	"log"
	"net/http"
)

const webPort = "80"

type Config struct{}

func main() {
	app := &Config{}
	log.Printf("Starting broker service on port %s\n", webPort)

	// difine http server
	svc := &http.Server{
		Addr:    fmt.Sprintf(":%s", webPort),
		Handler: app.routes(),
	}

	// start the server
	err := svc.ListenAndServe()
	if err != nil {
		log.Panic(err)
	}
}
