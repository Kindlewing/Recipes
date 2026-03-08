package main

import (
	"database/sql"
	"fmt"
	"net/http"
	"strings"

	"github.com/starfederation/datastar-go/datastar"
	_ "github.com/go-sql-driver/mysql"
)

type Recipe struct {
	ID          int
	Title       string
	Description string
}

func openDB() (*sql.DB, error) {
	db, err := sql.Open("mysql", "recipes:recipes@(127.0.0.1:3306)/recipes?parseTime=true")
	if err != nil {
		return nil, err
	}
	if err = db.Ping(); err != nil {
		return nil, err
	}
	return db, nil
}

func getAllRecipes(db *sql.DB) ([]Recipe, error) {
	rows, err := db.Query(`SELECT id, title, description FROM recipes`)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var recipes []Recipe
	for rows.Next() {
		var r Recipe
		if err := rows.Scan(&r.ID, &r.Title, &r.Description); err != nil {
			return nil, err
		}
		recipes = append(recipes, r)
	}
	return recipes, rows.Err()
}

func corsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, datastar-request, datastar-request-id")
		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusNoContent)
			return
		}
		next.ServeHTTP(w, r)
	})
}

func registerRoutes(mux *http.ServeMux, db *sql.DB) {
	mux.HandleFunc("GET /all", func(w http.ResponseWriter, r *http.Request) {
		recipes, err := getAllRecipes(db)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		sse := datastar.NewSSE(w, r)

		var html strings.Builder
		html.WriteString(`<main class="home" id="recipes">`)
		for _, recipe := range recipes {
			fmt.Fprintf(&html, `
		<article class="recipe" id="recipe-%d">
			<h2 class="recipe__title">%s</h2>
			<p class="recipe__subtitle">%s</p>
		</article>`, recipe.ID, recipe.Title, recipe.Description)
		}
		html.WriteString(`</main>`)
		sse.PatchElements(html.String())
	})
}

func main() {
	db, err := openDB()
	if err != nil {
		panic(err)
	}
	defer db.Close()

	mux := http.NewServeMux()
	registerRoutes(mux, db)
	http.ListenAndServe("0.0.0.0:8000", corsMiddleware(mux))
}
