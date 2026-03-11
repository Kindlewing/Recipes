package main

import (
	"net/http"

	"github.com/labstack/echo/v5"
)

func index(ctx *echo.Context) error {
	return ctx.String(http.StatusOK, "Hello, World!")
}

func registerRoutes(echo *echo.Echo) {
	echo.GET("/", index)
}
