package main

import (
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	registerRoutes(mux)

	http.ListenAndServe("127.0.0.1:8080", mux)
}
