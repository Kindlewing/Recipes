// Package main
package main

import (
	"net/http"

	"github.com/starfederation/datastar-go/datastar"
)

func getAllRecipes(writer http.ResponseWriter, request *http.Request) {
	sse := datastar.NewSSE(writer, request)

	sse.PatchElements(`
		<article class="recipe" id="recipe">
			<header>
				<h2 class="recipe__title">Espresso Ice Cream</h2>
				<p class="recipe__subtitle">
					This most delicious rich and silky espresso ice cream
					with a little caffeine boost.
				</p>
			</header>
			<div class="recipe__content">
				<section class="recipe__ingredients">
					<h3>Ingredients</h3>
					<ul>
						<li>2 cups heavy cream</li>
						<li>1/4 tsp. salt</li>
						<li>5 egg yolks</li>
						<li>1 1/2 tsp. vanilla extract</li>
						<li>2-4 shots espresso</li>
					</ul>
				</section>
				<section class="recipe__directions">
					<h3>Directions</h3>
					<ol>
						<li>
							In a medium saucepan, heat the cream, milk, sugar
							and salt over medium heat; whisking to dissolve the
							sugar (about 4 to 5 minutes).
						</li>
						<li>In a separate bowl, whisk the egg yolks.</li>
						<li>
							Gradually pour about 1 cup of the hot milk mixture
							into the egg yolk bowl, while continually whisking
							to temper the eggs.
						</li>
						<li>
							Add the tempered egg yolk mixture back to the pan
							while whisking until it just comes to a simmer.
						</li>
						<li>
							Remove the pan from the heat, then add the vanilla
							extract and espresso.
						</li>
						<li>
							Pour the ice cream base through a fine mesh strainer
							and chill completely.
						</li>
						<li>
							Spin in an ice cream maker according to the
							manufacturer's instructions.
						</li>
					</ol>
				</section>
			</div>
		</article>
	`)
}
