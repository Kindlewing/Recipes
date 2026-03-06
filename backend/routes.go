// Package main
package main

import (
	"database/sql"
	"fmt"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/starfederation/datastar-go/datastar"
)

var (
	id          int
	title       string
	description string
)

func getAllRecipes(writer http.ResponseWriter, request *http.Request) {
	sse := datastar.NewSSE(writer, request)

	db, err := sql.Open("mysql", "recipes:recipes@(127.0.0.1:3306)/recipes?parseTime=true")
	if err != nil {
		error := fmt.Sprintf("DB open error: %s\n", err.Error())
		panic(error)
	}
	defer db.Close()

	query := `SELECT id, title, description from recipes WHERE id = 1`
	err = db.QueryRow(query).Scan(&id, &title, &description)
	if err != nil {
		error := fmt.Sprintf("Query error: %s\n", err.Error())
		panic(error)
	}

	var html string = fmt.Sprintf(`
		<article class=recipe id=recipe>
			<header>
				<h2 class="recipe__title">%s</h2>
				<p class="recipe__subtitle">%s</p>
			</header>	
		</article>
	`, title, description)
	sse.PatchElements(html)
}
