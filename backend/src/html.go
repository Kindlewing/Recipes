package main

import (
	"fmt"
	"io"
	"log/slog"
	"time"
)

type Recipe struct {
	title       string
	desc        string
	ingredients []string
	directions  []string
	id          uint32
}

func recipeCard(w io.Writer, recipe *Recipe) {
	start := time.Now()
	fmt.Fprintf(w,
		`<article id="recipe-%d"><h2>%s</h2><p>%s</p></article>`,
		recipe.id, recipe.title, recipe.desc,
	)
	slog.Debug("recipeCard rendered", "id", recipe.id, "duration", time.Since(start))
}
