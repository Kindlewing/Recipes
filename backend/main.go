package main

import (
	"net/http"
)

func main() {
	var database Database
	databaseInit(&database)

	mux := http.NewServeMux()
	registerRoutes(mux, &database)

	http.ListenAndServe("127.0.0.1:8080", mux)
}
