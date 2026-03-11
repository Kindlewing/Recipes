package main

import (
	"net/http"
)

func index(writer http.ResponseWriter, request *http.Request) {

}

func registerRoutes(mux *http.ServeMux) {
	mux.HandleFunc("/", index)
}
