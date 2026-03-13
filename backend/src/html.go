package main

import (
	"fmt"
	"io"
	"log/slog"
	"time"
)

type Recipe struct {
	title       string   // 16 bytes
	desc        string   // 16 bytes
	ingredients []string // 24 bytes
	directions  []string // 24 bytes
	id          uint32   //  4 bytes — total: 88 (4 bytes padding after id)
}

func recipeCard(w io.Writer, recipe *Recipe) {
	start := time.Now()
	fmt.Fprintf(w,
		`<article id="recipe-%d"><h2>%s</h2><p>%s</p></article>`,
		recipe.id, recipe.title, recipe.desc,
	)

	slog.Debug("recipeCard rendered", "id", recipe.id, "duration", time.Since(start))
}
