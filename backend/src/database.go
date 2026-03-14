package main

import (
	"database/sql"
	"fmt"
)

func getAllRecipes() {
	db, err := sql.Open("mysql", "admin:Mu$ici$c00l1@recipes")
	if err != nil {
		panic(fmt.Sprintf("SQL open error: %s", err.Error()))
	}
	db.Begin
}
