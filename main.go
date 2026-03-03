package main

import (
	"fmt"
	"net/http"
	"strings"
)

type Recipe struct {
	ID          string
	Title       string
	Subtitle    string
	Ingredients []string
	Directions  []string
}

var recipes = []Recipe{
	{
		ID:       "espresso-ice-cream",
		Title:    "Espresso Ice Cream",
		Subtitle: "This most delicious rich and silky espresso ice cream with a little caffeine boost.",
		Ingredients: []string{
			"2 cups heavy cream",
			"1/4 tsp. salt",
			"5 egg yolks",
			"1 1/2 tsp. vanilla extract",
			"2-4 shots espresso",
		},
		Directions: []string{
			"In a medium saucepan, heat the cream, milk, sugar and salt over medium heat; whisking to dissolve the sugar (about 4 to 5 minutes).",
			"In a separate bowl, whisk the egg yolks.",
			"Gradually pour about 1 cup of the hot milk mixture into the egg yolk bowl, while continually whisking to temper the eggs.",
			"Add the tempered egg yolk mixture back to the pan while whisking until it just comes to a simmer.",
			"Remove the pan from the heat, then add the vanilla extract and espresso.",
			"Pour the ice cream base through a fine mesh strainer and chill completely.",
			"Spin in an ice cream maker according to the manufacturer's instructions.",
		},
	},
}

func buildRecipeHTML(r Recipe) string {
	var b strings.Builder

	b.WriteString(fmt.Sprintf(`<article class="recipe" id="%s">`, r.ID))

	b.WriteString(`<header>`)
	b.WriteString(fmt.Sprintf(`<h2 class="recipe__title">%s</h2>`, r.Title))
	b.WriteString(fmt.Sprintf(`<p class="recipe__subtitle">%s</p>`, r.Subtitle))
	b.WriteString(`</header>`)

	b.WriteString(`<section class="recipe__ingredients"><h3>Ingredients</h3><ul>`)
	for _, ingredient := range r.Ingredients {
		b.WriteString(fmt.Sprintf(`<li>%s</li>`, ingredient))
	}
	b.WriteString(`</ul></section>`)

	b.WriteString(`<section class="recipe__directions"><h3>Directions</h3><ol>`)
	for _, step := range r.Directions {
		b.WriteString(fmt.Sprintf(`<li>%s</li>`, step))
	}
	b.WriteString(`</ol></section>`)

	b.WriteString(`</article>`)

	return b.String()
}

func recipesHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/event-stream")
	w.Header().Set("Cache-Control", "no-cache")
	w.Header().Set("Connection", "keep-alive")

	var fragments strings.Builder
	for _, recipe := range recipes {
		fragments.WriteString(buildRecipeHTML(recipe))
	}

	// Datastar merges the HTML into the DOM at the element matching
	// the id of the outermost element in the fragment
	fmt.Fprintf(w, "event: datastar-merge-fragments\ndata: fragments %s\n\n", fragments.String())
}

func main() {
	http.Handle("/", http.FileServer(http.Dir("src")))
	http.HandleFunc("/recipes", recipesHandler)
	http.ListenAndServe(":8080", nil)
}
