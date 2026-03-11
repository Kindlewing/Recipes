package main

import (
	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
)

func main() {
	echo := echo.New()
	echo.Use(middleware.RequestLogger())

	if err := echo.Start(":1323"); err != nil {
		echo.Logger.Error("failed to start server", "error", err)
	}
}
