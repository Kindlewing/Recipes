CREATE DATABASE IF NOT EXISTS recipes;
USE recipes;

CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image VARCHAR(500)
);

CREATE TABLE ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT NOT NULL,
    ingredient TEXT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
);

CREATE TABLE directions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT NOT NULL,
    step_number INT NOT NULL,
    instruction TEXT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
);

-- ============================================================
-- Recipes
-- ============================================================

INSERT INTO recipes (id, title, description, image) VALUES
(1,  'Espresso Ice Cream',        'Rich and silky espresso ice cream with a caffeine kick.',                                'espresso-ice-cream.jpg'),
(2,  'Spaghetti Carbonara',       'Classic Roman pasta with eggs, guanciale, pecorino, and black pepper.',                  'spaghetti-carbonara.jpg'),
(3,  'Banana Bread',              'Moist, tender banana bread perfect for ripe bananas.',                                    'banana-bread.jpg'),
(4,  'Chicken Tikka Masala',      'Tender chicken in a creamy, spiced tomato sauce.',                                       'chicken-tikka-masala.jpg'),
(5,  'Beef Tacos',                'Juicy seasoned ground beef in warm tortillas with fresh toppings.',                      'beef-tacos.jpg'),
(6,  'Chocolate Chip Cookies',    'Perfectly crispy-edged, chewy-centered chocolate chip cookies.',                         'chocolate-chip-cookies.jpg'),
(7,  'Caesar Salad',              'Crisp romaine lettuce with homemade Caesar dressing and croutons.',                      'caesar-salad.jpg'),
(8,  'Beef Stew',                 'Hearty slow-cooked beef with root vegetables in a rich broth.',                          'beef-stew.jpg'),
(9,  'Lemon Garlic Pasta',        'Simple weeknight pasta with bright lemon, garlic, and parmesan.',                        'lemon-garlic-pasta.jpg'),
(10, 'Fluffy Pancakes',           'Light and fluffy buttermilk pancakes perfect for weekend mornings.',                     'fluffy-pancakes.jpg'),
(11, 'French Onion Soup',         'Deeply caramelized onion soup topped with a gruyere-covered crouton.',                  'french-onion-soup.jpg'),
(12, 'Guacamole',                 'Chunky, fresh guacamole with lime, cilantro, and jalapeño.',                             'guacamole.jpg'),
(13, 'Shakshuka',                 'Eggs poached in a spiced tomato and pepper sauce.',                                      'shakshuka.jpg'),
(14, 'Classic Beef Burger',       'Juicy smash-style burger with all the classic fixings.',                                 'classic-beef-burger.jpg'),
(15, 'Margherita Pizza',          'Thin-crust pizza with San Marzano tomatoes, fresh mozzarella, and basil.',              'margherita-pizza.jpg'),
(16, 'Chicken Noodle Soup',       'Comforting homemade chicken soup with egg noodles and vegetables.',                      'chicken-noodle-soup.jpg'),
(17, 'Pad Thai',                  'Street-style stir-fried rice noodles with tamarind, peanuts, and egg.',                  'pad-thai.jpg'),
(18, 'Blueberry Muffins',         'Bakery-style muffins bursting with fresh blueberries and a crunchy sugar top.',          'blueberry-muffins.jpg'),
(19, 'Grilled Salmon',            'Perfectly grilled salmon with a honey-garlic glaze.',                                    'grilled-salmon.jpg'),
(20, 'Beef and Broccoli',         'Tender beef and crisp broccoli in a savory ginger-soy sauce.',                           'beef-and-broccoli.jpg'),
(21, 'Hummus',                    'Smooth and creamy homemade hummus with olive oil and paprika.',                          'hummus.jpg'),
(22, 'Mushroom Risotto',          'Creamy arborio rice with mixed mushrooms, white wine, and parmesan.',                    'mushroom-risotto.jpg'),
(23, 'Fish Tacos',                'Crispy battered fish in corn tortillas with slaw and chipotle crema.',                   'fish-tacos.jpg'),
(24, 'Apple Pie',                 'Classic double-crust apple pie with cinnamon and a flaky butter crust.',                 'apple-pie.jpg'),
(25, 'Veggie Chili',              'Smoky, hearty chili packed with beans, peppers, and corn.',                              'veggie-chili.jpg'),
(26, 'Greek Salad',               'Fresh tomatoes, cucumber, olives, and feta with an herby vinaigrette.',                  'greek-salad.jpg'),
(27, 'Butter Chicken',            'Tender chicken in a rich, velvety tomato-cream sauce.',                                  'butter-chicken.jpg'),
(28, 'Pulled Pork',               'Fall-apart tender slow-roasted pork with smoky BBQ sauce.',                              'pulled-pork.jpg'),
(29, 'Caprese Salad',             'Ripe tomatoes, fresh mozzarella, and basil drizzled with balsamic glaze.',               'caprese-salad.jpg'),
(30, 'Beef Bolognese',            'Slow-simmered meat sauce with a depth of flavor from wine and milk.',                    'beef-bolognese.jpg'),
(31, 'Avocado Toast',             'Crushed avocado on toasted sourdough with chili flakes and lemon.',                      'avocado-toast.jpg'),
(32, 'Chicken Stir Fry',          'Quick and colorful chicken and vegetable stir fry in a savory sauce.',                   'chicken-stir-fry.jpg'),
(33, 'Miso Soup',                 'Simple and warming Japanese miso soup with tofu and wakame.',                             'miso-soup.jpg'),
(34, 'Sweet Potato Curry',        'Creamy coconut milk curry with sweet potato, spinach, and chickpeas.',                   'sweet-potato-curry.jpg'),
(35, 'Bruschetta',                'Toasted bread rubbed with garlic and topped with marinated fresh tomatoes.',              'bruschetta.jpg'),
(36, 'Beef Chili',                'Bold, thick chili with ground beef, kidney beans, and smoky spices.',                    'beef-chili.jpg'),
(37, 'Oatmeal Cookies',           'Chewy oatmeal cookies with raisins and warm cinnamon spice.',                            'oatmeal-cookies.jpg'),
(38, 'Tom Yum Soup',              'Fragrant Thai hot-and-sour soup with shrimp, lemongrass, and galangal.',                 'tom-yum-soup.jpg'),
(39, 'Eggs Benedict',             'Poached eggs on Canadian bacon and an English muffin with hollandaise.',                  'eggs-benedict.jpg'),
(40, 'Vegetable Fried Rice',      'Wok-tossed rice with vegetables, soy sauce, sesame oil, and egg.',                       'vegetable-fried-rice.jpg');

-- ============================================================
-- Ingredients
-- ============================================================

-- 1. Espresso Ice Cream
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(1, '2 cups heavy cream'),
(1, '1 cup whole milk'),
(1, '3/4 cup granulated sugar'),
(1, '1/4 tsp salt'),
(1, '5 egg yolks'),
(1, '1 1/2 tsp vanilla extract'),
(1, '2–4 shots espresso (about 1/2 cup)');

-- 2. Spaghetti Carbonara
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(2, '400g spaghetti'),
(2, '200g guanciale or pancetta, diced'),
(2, '4 large eggs'),
(2, '100g pecorino romano, finely grated'),
(2, '50g parmesan, finely grated'),
(2, 'Freshly cracked black pepper'),
(2, 'Salt');

-- 3. Banana Bread
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(3, '3 very ripe bananas'),
(3, '1/3 cup melted butter'),
(3, '3/4 cup sugar'),
(3, '1 egg, beaten'),
(3, '1 tsp vanilla extract'),
(3, '1 tsp baking soda'),
(3, 'Pinch of salt'),
(3, '1 1/2 cups all-purpose flour');

-- 4. Chicken Tikka Masala
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(4, '700g boneless chicken thighs, cubed'),
(4, '1 cup plain yogurt'),
(4, '2 tbsp tikka masala spice blend'),
(4, '2 tbsp oil'),
(4, '1 large onion, diced'),
(4, '4 garlic cloves, minced'),
(4, '1 tbsp fresh ginger, grated'),
(4, '1 can (400g) crushed tomatoes'),
(4, '1 cup heavy cream'),
(4, 'Salt and fresh cilantro to serve');

-- 5. Beef Tacos
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(5, '500g ground beef'),
(5, '1 packet taco seasoning'),
(5, '1/3 cup water'),
(5, '8 small flour or corn tortillas'),
(5, '1 cup shredded cheddar'),
(5, '1 cup shredded lettuce'),
(5, '2 roma tomatoes, diced'),
(5, 'Sour cream and salsa to serve');

-- 6. Chocolate Chip Cookies
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(6, '2 1/4 cups all-purpose flour'),
(6, '1 tsp baking soda'),
(6, '1 tsp salt'),
(6, '1 cup (2 sticks) butter, softened'),
(6, '3/4 cup granulated sugar'),
(6, '3/4 cup packed brown sugar'),
(6, '2 large eggs'),
(6, '2 tsp vanilla extract'),
(6, '2 cups chocolate chips');

-- 7. Caesar Salad
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(7, '2 romaine hearts, chopped'),
(7, '1/2 cup parmesan, shaved'),
(7, '1 cup croutons'),
(7, '3 tbsp mayonnaise'),
(7, '1 tbsp Dijon mustard'),
(7, '1 tbsp Worcestershire sauce'),
(7, '2 garlic cloves, minced'),
(7, 'Juice of 1 lemon'),
(7, '2 tbsp olive oil'),
(7, 'Salt and black pepper');

-- 8. Beef Stew
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(8, '1 kg beef chuck, cut into cubes'),
(8, '3 carrots, sliced'),
(8, '3 potatoes, cubed'),
(8, '2 celery stalks, sliced'),
(8, '1 onion, diced'),
(8, '3 garlic cloves, minced'),
(8, '2 cups beef broth'),
(8, '1 cup red wine'),
(8, '2 tbsp tomato paste'),
(8, '2 tbsp flour'),
(8, '2 tbsp oil'),
(8, 'Salt, pepper, thyme, bay leaves');

-- 9. Lemon Garlic Pasta
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(9, '400g spaghetti or linguine'),
(9, '4 garlic cloves, thinly sliced'),
(9, 'Zest and juice of 2 lemons'),
(9, '1/2 cup parmesan, grated'),
(9, '4 tbsp olive oil'),
(9, 'Red pepper flakes'),
(9, 'Salt and black pepper'),
(9, 'Fresh parsley, chopped');

-- 10. Fluffy Pancakes
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(10, '1 1/2 cups all-purpose flour'),
(10, '3 1/2 tsp baking powder'),
(10, '1 tsp salt'),
(10, '1 tbsp sugar'),
(10, '1 1/4 cups milk'),
(10, '1 egg'),
(10, '3 tbsp melted butter'),
(10, 'Butter and maple syrup to serve');

-- 11. French Onion Soup
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(11, '4 large yellow onions, thinly sliced'),
(11, '4 tbsp butter'),
(11, '1 tbsp oil'),
(11, '1 tsp sugar'),
(11, '1/2 cup dry white wine'),
(11, '4 cups beef broth'),
(11, '2 sprigs fresh thyme'),
(11, '4 baguette slices, toasted'),
(11, '1 1/2 cups gruyere, grated'),
(11, 'Salt and black pepper');

-- 12. Guacamole
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(12, '3 ripe avocados'),
(12, 'Juice of 1–2 limes'),
(12, '1/2 tsp kosher salt'),
(12, '1/2 red onion, finely diced'),
(12, '1 jalapeño, seeded and minced'),
(12, '2 tbsp fresh cilantro, chopped'),
(12, '1 roma tomato, diced');

-- 13. Shakshuka
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(13, '2 tbsp olive oil'),
(13, '1 onion, diced'),
(13, '1 red bell pepper, diced'),
(13, '4 garlic cloves, minced'),
(13, '1 tsp cumin'),
(13, '1 tsp paprika'),
(13, '1/2 tsp chili flakes'),
(13, '1 can (400g) crushed tomatoes'),
(13, '4–6 eggs'),
(13, 'Fresh parsley or cilantro, feta to serve');

-- 14. Classic Beef Burger
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(14, '500g ground beef (80/20)'),
(14, '4 burger buns'),
(14, '4 slices American cheese'),
(14, 'Lettuce, tomato, onion'),
(14, 'Ketchup, mustard, mayo'),
(14, 'Salt and black pepper'),
(14, '1 tbsp butter');

-- 15. Margherita Pizza
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(15, '300g pizza dough'),
(15, '1/2 cup San Marzano tomato sauce'),
(15, '200g fresh mozzarella, sliced'),
(15, 'Fresh basil leaves'),
(15, '2 tbsp olive oil'),
(15, 'Salt and black pepper');

-- 16. Chicken Noodle Soup
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(16, '1 whole chicken (or 4 bone-in thighs)'),
(16, '3 carrots, sliced'),
(16, '3 celery stalks, sliced'),
(16, '1 onion, diced'),
(16, '3 garlic cloves, minced'),
(16, '200g egg noodles'),
(16, '6 cups chicken broth'),
(16, 'Fresh thyme and parsley'),
(16, 'Salt and black pepper');

-- 17. Pad Thai
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(17, '200g flat rice noodles'),
(17, '200g shrimp or chicken, sliced'),
(17, '2 eggs'),
(17, '3 tbsp tamarind paste'),
(17, '2 tbsp fish sauce'),
(17, '1 tbsp sugar'),
(17, '3 tbsp oil'),
(17, '3 spring onions, sliced'),
(17, '100g bean sprouts'),
(17, '1/2 cup peanuts, crushed'),
(17, 'Lime wedges and chili flakes to serve');

-- 18. Blueberry Muffins
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(18, '2 cups all-purpose flour'),
(18, '1 tbsp baking powder'),
(18, '1/2 tsp salt'),
(18, '3/4 cup granulated sugar'),
(18, '1/3 cup melted butter'),
(18, '2 eggs'),
(18, '3/4 cup milk'),
(18, '1 tsp vanilla extract'),
(18, '1 1/2 cups fresh blueberries'),
(18, '2 tbsp coarse sugar for topping');

-- 19. Grilled Salmon
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(19, '4 salmon fillets'),
(19, '3 tbsp honey'),
(19, '3 tbsp soy sauce'),
(19, '4 garlic cloves, minced'),
(19, '1 tbsp olive oil'),
(19, 'Juice of 1 lemon'),
(19, 'Salt and black pepper'),
(19, 'Fresh dill or parsley to serve');

-- 20. Beef and Broccoli
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(20, '500g flank steak, thinly sliced'),
(20, '3 cups broccoli florets'),
(20, '4 garlic cloves, minced'),
(20, '1 tbsp fresh ginger, grated'),
(20, '1/4 cup soy sauce'),
(20, '2 tbsp oyster sauce'),
(20, '1 tbsp cornstarch'),
(20, '1 tsp sesame oil'),
(20, '2 tbsp vegetable oil'),
(20, '1 tsp sugar');

-- 21. Hummus
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(21, '1 can (400g) chickpeas, drained'),
(21, '3 tbsp tahini'),
(21, 'Juice of 1–2 lemons'),
(21, '2 garlic cloves'),
(21, '3 tbsp olive oil'),
(21, '3 tbsp cold water'),
(21, '1/2 tsp cumin'),
(21, 'Salt'),
(21, 'Paprika and olive oil to serve');

-- 22. Mushroom Risotto
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(22, '300g arborio rice'),
(22, '400g mixed mushrooms, sliced'),
(22, '1 onion, finely diced'),
(22, '3 garlic cloves, minced'),
(22, '1/2 cup dry white wine'),
(22, '1 litre warm chicken or vegetable broth'),
(22, '50g parmesan, grated'),
(22, '2 tbsp butter'),
(22, '2 tbsp olive oil'),
(22, 'Fresh thyme, salt, and black pepper');

-- 23. Fish Tacos
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(23, '600g white fish fillets (cod or tilapia)'),
(23, '1 cup all-purpose flour'),
(23, '1 cup beer'),
(23, '1 tsp paprika'),
(23, '1 tsp cumin'),
(23, '8 corn tortillas'),
(23, '2 cups shredded cabbage'),
(23, '1/2 cup sour cream'),
(23, '1–2 chipotle peppers in adobo'),
(23, 'Lime wedges and cilantro to serve');

-- 24. Apple Pie
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(24, '2 unbaked 9-inch pie crusts'),
(24, '6 cups peeled, sliced apples (Granny Smith)'),
(24, '3/4 cup granulated sugar'),
(24, '2 tbsp all-purpose flour'),
(24, '1 tsp cinnamon'),
(24, '1/4 tsp nutmeg'),
(24, '1/4 tsp salt'),
(24, '2 tbsp butter, cut into pieces'),
(24, '1 egg, beaten (egg wash)');

-- 25. Veggie Chili
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(25, '1 can (400g) kidney beans, drained'),
(25, '1 can (400g) black beans, drained'),
(25, '1 can (400g) crushed tomatoes'),
(25, '1 cup corn kernels'),
(25, '1 red bell pepper, diced'),
(25, '1 green bell pepper, diced'),
(25, '1 onion, diced'),
(25, '3 garlic cloves, minced'),
(25, '2 tbsp chili powder'),
(25, '1 tsp cumin'),
(25, '1 tsp smoked paprika'),
(25, 'Salt, sour cream, and cheese to serve');

-- 26. Greek Salad
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(26, '3 large tomatoes, cut into wedges'),
(26, '1 cucumber, sliced'),
(26, '1/2 red onion, thinly sliced'),
(26, '1/2 cup kalamata olives'),
(26, '200g feta cheese, cubed'),
(26, '1 tsp dried oregano'),
(26, '3 tbsp olive oil'),
(26, '1 tbsp red wine vinegar'),
(26, 'Salt and black pepper');

-- 27. Butter Chicken
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(27, '700g boneless chicken, cubed'),
(27, '1 cup plain yogurt'),
(27, '2 tbsp butter chicken spice blend'),
(27, '3 tbsp butter'),
(27, '1 large onion, finely diced'),
(27, '4 garlic cloves, minced'),
(27, '1 tbsp fresh ginger, grated'),
(27, '1 can (400g) crushed tomatoes'),
(27, '1 cup heavy cream'),
(27, '1 tsp sugar'),
(27, 'Salt and fresh cilantro to serve');

-- 28. Pulled Pork
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(28, '2 kg pork shoulder'),
(28, '2 tbsp brown sugar'),
(28, '1 tbsp paprika'),
(28, '1 tbsp garlic powder'),
(28, '1 tbsp onion powder'),
(28, '1 tsp cayenne pepper'),
(28, '1 tsp cumin'),
(28, 'Salt and black pepper'),
(28, '1 cup BBQ sauce'),
(28, '1/2 cup apple cider vinegar');

-- 29. Caprese Salad
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(29, '4 large ripe tomatoes, sliced'),
(29, '300g fresh mozzarella, sliced'),
(29, 'Large bunch fresh basil'),
(29, '3 tbsp extra-virgin olive oil'),
(29, '2 tbsp balsamic glaze'),
(29, 'Flaky sea salt and black pepper');

-- 30. Beef Bolognese
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(30, '500g ground beef'),
(30, '1 onion, finely diced'),
(30, '2 carrots, finely diced'),
(30, '2 celery stalks, finely diced'),
(30, '4 garlic cloves, minced'),
(30, '1/2 cup dry red wine'),
(30, '1/2 cup whole milk'),
(30, '1 can (400g) crushed tomatoes'),
(30, '2 tbsp olive oil'),
(30, 'Salt, pepper, parmesan, and tagliatelle to serve');

-- 31. Avocado Toast
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(31, '2 ripe avocados'),
(31, '4 slices thick sourdough bread'),
(31, 'Juice of 1 lemon'),
(31, '1/2 tsp red pepper flakes'),
(31, 'Flaky sea salt'),
(31, '2 tbsp extra-virgin olive oil'),
(31, '2 eggs, poached (optional)');

-- 32. Chicken Stir Fry
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(32, '500g boneless chicken breast, sliced thin'),
(32, '1 red bell pepper, sliced'),
(32, '1 yellow bell pepper, sliced'),
(32, '1 cup snap peas'),
(32, '1 cup broccoli florets'),
(32, '3 garlic cloves, minced'),
(32, '1 tbsp fresh ginger, grated'),
(32, '3 tbsp soy sauce'),
(32, '1 tbsp hoisin sauce'),
(32, '1 tsp sesame oil'),
(32, '2 tbsp vegetable oil');

-- 33. Miso Soup
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(33, '4 cups dashi stock (or water with dashi powder)'),
(33, '3 tbsp white or red miso paste'),
(33, '200g soft tofu, cubed'),
(33, '2 tbsp dried wakame seaweed'),
(33, '2 spring onions, sliced');

-- 34. Sweet Potato Curry
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(34, '2 large sweet potatoes, peeled and cubed'),
(34, '1 can (400g) chickpeas, drained'),
(34, '2 cups fresh spinach'),
(34, '1 can (400ml) coconut milk'),
(34, '1 can (400g) crushed tomatoes'),
(34, '1 onion, diced'),
(34, '3 garlic cloves, minced'),
(34, '1 tbsp fresh ginger, grated'),
(34, '2 tbsp curry powder'),
(34, '1 tbsp coconut oil'),
(34, 'Salt, lime juice, and cilantro to serve');

-- 35. Bruschetta
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(35, '1 baguette, sliced 1cm thick'),
(35, '4 ripe tomatoes, finely diced'),
(35, '1/4 red onion, finely diced'),
(35, '2 garlic cloves (1 halved for rubbing, 1 minced)'),
(35, '1/4 cup fresh basil, sliced thin'),
(35, '3 tbsp extra-virgin olive oil'),
(35, '1 tbsp balsamic vinegar'),
(35, 'Flaky salt and black pepper');

-- 36. Beef Chili
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(36, '700g ground beef'),
(36, '1 can (400g) kidney beans, drained'),
(36, '1 can (400g) diced tomatoes'),
(36, '1 can (180g) tomato paste'),
(36, '1 onion, diced'),
(36, '3 garlic cloves, minced'),
(36, '1 red bell pepper, diced'),
(36, '2 tbsp chili powder'),
(36, '1 tsp cumin'),
(36, '1 tsp smoked paprika'),
(36, '1 cup beef broth'),
(36, 'Salt, sour cream, shredded cheddar to serve');

-- 37. Oatmeal Cookies
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(37, '1 cup (2 sticks) butter, softened'),
(37, '1 cup granulated sugar'),
(37, '1 cup packed brown sugar'),
(37, '2 eggs'),
(37, '1 tsp vanilla extract'),
(37, '1 1/2 cups all-purpose flour'),
(37, '1 tsp baking soda'),
(37, '1 tsp cinnamon'),
(37, '1/2 tsp salt'),
(37, '3 cups rolled oats'),
(37, '1 cup raisins');

-- 38. Tom Yum Soup
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(38, '1 litre chicken or shrimp broth'),
(38, '300g shrimp, peeled'),
(38, '2 stalks lemongrass, bruised'),
(38, '4 slices fresh galangal or ginger'),
(38, '4 kaffir lime leaves'),
(38, '200g mushrooms, halved'),
(38, '2 tbsp fish sauce'),
(38, '2 tbsp lime juice'),
(38, '1 tbsp sugar'),
(38, '2 Thai chilies, sliced'),
(38, 'Fresh cilantro to serve');

-- 39. Eggs Benedict
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(39, '4 English muffins, split and toasted'),
(39, '8 slices Canadian bacon'),
(39, '8 large eggs'),
(39, '3 egg yolks'),
(39, '1 tbsp lemon juice'),
(39, '1/2 cup (1 stick) butter, melted'),
(39, '1 tbsp white vinegar (for poaching)'),
(39, 'Pinch of cayenne'),
(39, 'Salt and black pepper'),
(39, 'Fresh chives to serve');

-- 40. Vegetable Fried Rice
INSERT INTO ingredients (recipe_id, ingredient) VALUES
(40, '3 cups cooked day-old rice'),
(40, '2 eggs, beaten'),
(40, '1 cup frozen peas and carrots, thawed'),
(40, '1 cup corn kernels'),
(40, '3 garlic cloves, minced'),
(40, '3 tbsp soy sauce'),
(40, '1 tsp sesame oil'),
(40, '2 tbsp vegetable oil'),
(40, '3 spring onions, sliced');

-- ============================================================
-- Directions
-- ============================================================

-- 1. Espresso Ice Cream
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(1, 1, 'Heat cream, milk, sugar, and salt in a saucepan over medium heat, whisking until sugar dissolves, about 4–5 minutes.'),
(1, 2, 'In a bowl, whisk the egg yolks until smooth.'),
(1, 3, 'Slowly pour about 1 cup of the hot cream mixture into the yolks while whisking to temper them.'),
(1, 4, 'Pour the tempered egg mixture back into the saucepan, whisking constantly, until it just comes to a simmer.'),
(1, 5, 'Remove from heat and stir in vanilla extract and espresso.'),
(1, 6, 'Strain through a fine-mesh sieve and chill completely in the refrigerator (at least 4 hours or overnight).'),
(1, 7, 'Churn in an ice cream maker per the manufacturer''s instructions, then freeze until firm.');

-- 2. Spaghetti Carbonara
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(2, 1, 'Cook spaghetti in heavily salted boiling water until al dente. Reserve 1 cup pasta water before draining.'),
(2, 2, 'Fry guanciale in a pan over medium heat until crispy. Remove from heat.'),
(2, 3, 'Whisk together eggs, pecorino, parmesan, and a generous amount of black pepper in a bowl.'),
(2, 4, 'Add hot drained pasta to the pan with the guanciale, off heat.'),
(2, 5, 'Pour the egg mixture over the pasta, tossing vigorously and adding pasta water a splash at a time to create a glossy sauce.'),
(2, 6, 'Serve immediately with extra cheese and black pepper.');

-- 3. Banana Bread
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(3, 1, 'Preheat oven to 175°C (350°F). Grease a 9x5 inch loaf pan.'),
(3, 2, 'Mash bananas in a large bowl, then mix in melted butter.'),
(3, 3, 'Stir in sugar, beaten egg, and vanilla.'),
(3, 4, 'Sprinkle in baking soda and salt, then fold in flour until just combined.'),
(3, 5, 'Pour batter into the prepared pan and bake for 55–65 minutes, until a toothpick inserted in the center comes out clean.'),
(3, 6, 'Cool in the pan for 10 minutes, then turn out onto a wire rack.');

-- 4. Chicken Tikka Masala
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(4, 1, 'Marinate chicken in yogurt and half the spice blend for at least 1 hour, or overnight.'),
(4, 2, 'Grill or pan-sear the chicken over high heat until charred and cooked through. Set aside.'),
(4, 3, 'Heat oil in a large pan, sauté onion until soft and golden, about 8 minutes.'),
(4, 4, 'Add garlic, ginger, and remaining spice blend. Cook for 2 minutes.'),
(4, 5, 'Pour in crushed tomatoes and simmer for 10 minutes.'),
(4, 6, 'Stir in cream, add the cooked chicken, and simmer 5 more minutes. Season with salt.'),
(4, 7, 'Serve over basmati rice, garnished with cilantro.');

-- 5. Beef Tacos
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(5, 1, 'Brown ground beef in a skillet over medium-high heat, breaking it apart. Drain excess fat.'),
(5, 2, 'Add taco seasoning and water. Stir and simmer for 3–4 minutes until thickened.'),
(5, 3, 'Warm tortillas in a dry pan or directly over a gas flame.'),
(5, 4, 'Fill tortillas with seasoned beef and desired toppings.');

-- 6. Chocolate Chip Cookies
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(6, 1, 'Preheat oven to 190°C (375°F). Line baking sheets with parchment.'),
(6, 2, 'Whisk flour, baking soda, and salt in a bowl. Set aside.'),
(6, 3, 'Beat butter and both sugars until light and fluffy, about 3 minutes.'),
(6, 4, 'Beat in eggs and vanilla.'),
(6, 5, 'Stir in flour mixture until just combined, then fold in chocolate chips.'),
(6, 6, 'Drop rounded tablespoons of dough onto prepared sheets, 2 inches apart.'),
(6, 7, 'Bake 9–11 minutes until edges are golden. Cool on the pan for 5 minutes before transferring.');

-- 7. Caesar Salad
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(7, 1, 'Whisk together mayonnaise, Dijon, Worcestershire, garlic, and lemon juice.'),
(7, 2, 'Slowly whisk in olive oil until emulsified. Season with salt and pepper.'),
(7, 3, 'Toss romaine with enough dressing to coat, then add parmesan and croutons.'),
(7, 4, 'Serve immediately with extra parmesan on top.');

-- 8. Beef Stew
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(8, 1, 'Season beef with salt and pepper, then toss in flour.'),
(8, 2, 'Sear beef in batches in oil over high heat until browned on all sides. Set aside.'),
(8, 3, 'Sauté onion, celery, and garlic in the same pot until softened.'),
(8, 4, 'Stir in tomato paste, then add wine and scrape up the browned bits.'),
(8, 5, 'Return beef to pot. Add broth, thyme, and bay leaves. Bring to a simmer.'),
(8, 6, 'Cover and cook over low heat for 1.5 hours.'),
(8, 7, 'Add carrots and potatoes and cook for another 30–40 minutes until tender. Adjust seasoning.');

-- 9. Lemon Garlic Pasta
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(9, 1, 'Cook pasta in salted boiling water until al dente. Reserve 1 cup pasta water before draining.'),
(9, 2, 'In a large pan, gently warm olive oil with garlic and pepper flakes over medium-low heat for 2–3 minutes.'),
(9, 3, 'Add drained pasta to the pan with lemon zest and juice. Toss well.'),
(9, 4, 'Add pasta water a splash at a time to loosen the sauce.'),
(9, 5, 'Remove from heat, stir in parmesan, and top with parsley. Season to taste.');

-- 10. Fluffy Pancakes
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(10, 1, 'Whisk together flour, baking powder, salt, and sugar in a bowl.'),
(10, 2, 'In another bowl, whisk together milk, egg, and melted butter.'),
(10, 3, 'Pour wet ingredients into dry ingredients and stir until just combined (lumps are fine).'),
(10, 4, 'Heat a non-stick pan over medium heat and grease lightly with butter.'),
(10, 5, 'Pour 1/4 cup of batter per pancake. Cook until bubbles form on top and edges look set, then flip.'),
(10, 6, 'Cook 1–2 more minutes. Serve immediately with butter and maple syrup.');

-- 11. French Onion Soup
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(11, 1, 'Melt butter with oil in a large pot over medium-low heat. Add onions and stir to coat.'),
(11, 2, 'Cook onions, stirring occasionally, until deeply caramelized and golden, about 45–60 minutes.'),
(11, 3, 'Sprinkle in sugar and cook for another 2 minutes.'),
(11, 4, 'Add wine and cook until nearly evaporated, scraping up any browned bits.'),
(11, 5, 'Add broth and thyme. Simmer for 15–20 minutes. Season with salt and pepper.'),
(11, 6, 'Ladle soup into oven-safe bowls, top with toasted baguette slices and gruyere.'),
(11, 7, 'Broil until cheese is bubbly and golden. Serve immediately.');

-- 12. Guacamole
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(12, 1, 'Halve avocados, remove pits, and scoop flesh into a bowl.'),
(12, 2, 'Mash with a fork to your preferred consistency (chunky or smooth).'),
(12, 3, 'Stir in lime juice and salt.'),
(12, 4, 'Fold in red onion, jalapeño, cilantro, and tomato.'),
(12, 5, 'Taste and adjust lime juice and salt. Serve with tortilla chips.');

-- 13. Shakshuka
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(13, 1, 'Heat oil in a large skillet over medium heat. Sauté onion and bell pepper until softened, about 7 minutes.'),
(13, 2, 'Add garlic, cumin, paprika, and chili flakes. Cook for 1 minute.'),
(13, 3, 'Pour in crushed tomatoes. Season with salt and simmer for 10 minutes.'),
(13, 4, 'Make wells in the sauce and crack an egg into each well.'),
(13, 5, 'Cover and cook until egg whites are set but yolks are still runny, about 5–7 minutes.'),
(13, 6, 'Garnish with parsley or cilantro and crumbled feta. Serve with crusty bread.');

-- 14. Classic Beef Burger
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(14, 1, 'Divide ground beef into 4 balls. Smash flat on a very hot, lightly oiled cast-iron pan.'),
(14, 2, 'Season generously with salt and pepper. Cook for 2–3 minutes until a dark crust forms.'),
(14, 3, 'Flip, add a slice of cheese, and cook for 1–2 more minutes.'),
(14, 4, 'Toast buns in butter in the same pan.'),
(14, 5, 'Assemble burgers with preferred condiments and toppings. Serve immediately.');

-- 15. Margherita Pizza
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(15, 1, 'Preheat oven to maximum (at least 260°C/500°F) with a pizza stone or baking sheet inside.'),
(15, 2, 'Stretch dough out on a floured surface into a thin round.'),
(15, 3, 'Spread a thin, even layer of tomato sauce over the dough. Season with salt.'),
(15, 4, 'Arrange mozzarella slices over the sauce and drizzle with olive oil.'),
(15, 5, 'Slide onto the hot stone and bake for 8–12 minutes until crust is blistered and golden.'),
(15, 6, 'Top with fresh basil leaves immediately after removing from the oven.');

-- 16. Chicken Noodle Soup
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(16, 1, 'Place chicken in a large pot with broth, thyme, and enough water to cover. Bring to a boil.'),
(16, 2, 'Reduce heat, skim any foam, and simmer for 45 minutes until chicken is cooked through.'),
(16, 3, 'Remove chicken, shred the meat, and discard the bones.'),
(16, 4, 'Sauté onion, carrots, celery, and garlic in a little oil in the pot, then add the strained broth.'),
(16, 5, 'Bring to a boil, add egg noodles, and cook per package instructions.'),
(16, 6, 'Return shredded chicken to the pot. Season with salt and pepper. Garnish with parsley.');

-- 17. Pad Thai
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(17, 1, 'Soak rice noodles in warm water for 20–30 minutes until pliable. Drain.'),
(17, 2, 'Mix tamarind paste, fish sauce, and sugar in a bowl. Set aside.'),
(17, 3, 'Heat oil in a wok over high heat. Add chicken or shrimp and cook until done. Push to the side.'),
(17, 4, 'Scramble eggs in the wok, then toss with the protein.'),
(17, 5, 'Add noodles and sauce, tossing to coat for 2–3 minutes.'),
(17, 6, 'Toss in bean sprouts and spring onions. Serve topped with crushed peanuts and lime.');

-- 18. Blueberry Muffins
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(18, 1, 'Preheat oven to 200°C (400°F). Line a muffin tin with paper liners.'),
(18, 2, 'Whisk flour, baking powder, salt, and sugar in a large bowl.'),
(18, 3, 'In another bowl, whisk butter, eggs, milk, and vanilla.'),
(18, 4, 'Add wet ingredients to dry and stir until just combined. Fold in blueberries.'),
(18, 5, 'Fill liners to the top and sprinkle with coarse sugar.'),
(18, 6, 'Bake for 18–22 minutes until a toothpick comes out clean. Cool in the pan for 5 minutes.');

-- 19. Grilled Salmon
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(19, 1, 'Whisk honey, soy sauce, garlic, olive oil, and lemon juice in a bowl. Reserve 2 tbsp.'),
(19, 2, 'Marinate salmon in the sauce for 15–30 minutes.'),
(19, 3, 'Preheat grill or grill pan to medium-high. Oil the grates.'),
(19, 4, 'Grill salmon skin-side down for 4–5 minutes, then flip carefully.'),
(19, 5, 'Brush with reserved sauce and cook 3–4 more minutes until salmon flakes easily.'),
(19, 6, 'Serve garnished with fresh dill or parsley and lemon wedges.');

-- 20. Beef and Broccoli
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(20, 1, 'Toss beef slices with cornstarch. Mix soy sauce, oyster sauce, sugar, and sesame oil in a bowl.'),
(20, 2, 'Heat oil in a wok over high heat. Stir-fry beef in batches until browned. Set aside.'),
(20, 3, 'Stir-fry broccoli for 2–3 minutes until bright green.'),
(20, 4, 'Add garlic and ginger and cook for 30 seconds.'),
(20, 5, 'Return beef to wok, pour over sauce, and toss everything together for 1 minute.'),
(20, 6, 'Serve immediately over steamed white rice.');

-- 21. Hummus
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(21, 1, 'Add chickpeas, tahini, lemon juice, garlic, cumin, and salt to a food processor.'),
(21, 2, 'Process for 1 minute, then scrape down the sides.'),
(21, 3, 'With the motor running, drizzle in cold water and blend for 3–4 minutes until very smooth.'),
(21, 4, 'Taste and adjust seasoning.'),
(21, 5, 'Spread into a bowl, drizzle with olive oil, and dust with paprika. Serve with warm pita.');

-- 22. Mushroom Risotto
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(22, 1, 'Warm broth in a pot over low heat and keep it at a gentle simmer.'),
(22, 2, 'Sauté mushrooms in butter in a large pan over high heat until golden. Season and set aside.'),
(22, 3, 'In the same pan, heat olive oil and cook onion and garlic over medium heat until soft.'),
(22, 4, 'Add rice and stir for 1–2 minutes until translucent at the edges.'),
(22, 5, 'Add wine and stir until absorbed.'),
(22, 6, 'Add warm broth one ladleful at a time, stirring constantly and waiting until each addition is absorbed before adding the next, about 18–20 minutes total.'),
(22, 7, 'Stir in mushrooms, parmesan, and a knob of butter. Season to taste. Serve immediately.');

-- 23. Fish Tacos
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(23, 1, 'Pat fish dry. Whisk flour, beer, paprika, and cumin into a smooth batter.'),
(23, 2, 'Heat 2–3cm of oil in a heavy pan to 180°C (350°F).'),
(23, 3, 'Dip fish in batter and fry in batches for 3–4 minutes per side until golden. Drain on paper towels.'),
(23, 4, 'Blend sour cream with chipotle peppers to make the crema.'),
(23, 5, 'Warm tortillas, fill with fried fish, cabbage, and crema.'),
(23, 6, 'Top with cilantro and a squeeze of lime. Serve immediately.');

-- 24. Apple Pie
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(24, 1, 'Preheat oven to 220°C (425°F). Line a 9-inch pie dish with one crust.'),
(24, 2, 'Toss sliced apples with sugar, flour, cinnamon, nutmeg, and salt in a bowl.'),
(24, 3, 'Pour filling into the crust and dot with butter.'),
(24, 4, 'Lay the second crust over the top, seal and crimp the edges, and cut several vents.'),
(24, 5, 'Brush with egg wash and bake for 15 minutes.'),
(24, 6, 'Reduce oven to 175°C (350°F) and bake for 35–40 more minutes until crust is golden and filling is bubbling.'),
(24, 7, 'Cool at least 2 hours before slicing to allow the filling to set.');

-- 25. Veggie Chili
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(25, 1, 'Heat a little oil in a large pot. Sauté onion and bell peppers until softened, about 5 minutes.'),
(25, 2, 'Add garlic, chili powder, cumin, and paprika. Cook for 1 minute.'),
(25, 3, 'Add crushed tomatoes, both cans of beans, and corn. Stir to combine.'),
(25, 4, 'Bring to a boil, then reduce heat and simmer uncovered for 25–30 minutes, stirring occasionally.'),
(25, 5, 'Season with salt. Serve with sour cream, shredded cheese, and cornbread.');

-- 26. Greek Salad
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(26, 1, 'Combine tomatoes, cucumber, red onion, and olives in a large bowl.'),
(26, 2, 'Whisk olive oil, red wine vinegar, oregano, salt, and pepper in a small bowl.'),
(26, 3, 'Drizzle dressing over the salad and toss gently.'),
(26, 4, 'Top with feta cubes. Serve immediately or let sit 10 minutes to meld flavors.');

-- 27. Butter Chicken
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(27, 1, 'Marinate chicken in yogurt and 1 tbsp of spice blend for at least 1 hour.'),
(27, 2, 'Grill or broil chicken until charred and cooked through. Set aside.'),
(27, 3, 'Melt butter in a pan, sauté onion until golden. Add garlic, ginger, and remaining spice. Cook 2 minutes.'),
(27, 4, 'Add crushed tomatoes and simmer for 15 minutes until sauce deepens in color.'),
(27, 5, 'Blend sauce until smooth (optional), then stir in cream and sugar.'),
(27, 6, 'Add chicken and simmer 10 minutes. Serve over rice with naan and cilantro.');

-- 28. Pulled Pork
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(28, 1, 'Mix all dry spices together and rub all over the pork shoulder. Let sit overnight in the fridge.'),
(28, 2, 'Preheat oven to 150°C (300°F).'),
(28, 3, 'Place pork in a roasting pan, add apple cider vinegar to the bottom, and cover tightly with foil.'),
(28, 4, 'Roast for 4–5 hours until the meat is completely tender and falling apart.'),
(28, 5, 'Remove from oven, let rest 15 minutes, then shred with two forks.'),
(28, 6, 'Toss shredded meat with BBQ sauce. Serve on buns with coleslaw.');

-- 29. Caprese Salad
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(29, 1, 'Arrange alternating slices of tomato and mozzarella on a platter.'),
(29, 2, 'Tuck fresh basil leaves between the slices.'),
(29, 3, 'Drizzle with olive oil and balsamic glaze.'),
(29, 4, 'Season generously with flaky salt and black pepper. Serve immediately.');

-- 30. Beef Bolognese
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(30, 1, 'Heat olive oil in a large pot. Cook onion, carrot, and celery over medium heat until very soft, about 10 minutes.'),
(30, 2, 'Add garlic and cook for 1 minute.'),
(30, 3, 'Add ground beef and cook, breaking it up, until well browned. Drain any excess fat.'),
(30, 4, 'Pour in red wine and simmer until nearly evaporated.'),
(30, 5, 'Stir in crushed tomatoes and milk. Season with salt and pepper.'),
(30, 6, 'Partially cover and simmer over very low heat for at least 1.5–2 hours, stirring occasionally.'),
(30, 7, 'Serve over freshly cooked tagliatelle with plenty of parmesan.');

-- 31. Avocado Toast
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(31, 1, 'Toast sourdough slices until golden and crispy.'),
(31, 2, 'Scoop avocado flesh into a bowl. Add lemon juice and a pinch of salt, then mash to your liking.'),
(31, 3, 'Spread mashed avocado generously over each toast.'),
(31, 4, 'Drizzle with olive oil and sprinkle with red pepper flakes and flaky salt.'),
(31, 5, 'Top with a poached egg if desired. Serve immediately.');

-- 32. Chicken Stir Fry
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(32, 1, 'Mix soy sauce and hoisin sauce in a small bowl. Set aside.'),
(32, 2, 'Heat vegetable oil in a wok over high heat. Add chicken and cook until golden, about 4–5 minutes. Set aside.'),
(32, 3, 'Add more oil if needed, then stir-fry broccoli and snap peas for 2 minutes.'),
(32, 4, 'Add bell peppers, garlic, and ginger. Stir-fry for 1 minute.'),
(32, 5, 'Return chicken to the wok, pour over the sauce, and toss everything together for 1 minute.'),
(32, 6, 'Drizzle with sesame oil and serve over steamed rice.');

-- 33. Miso Soup
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(33, 1, 'Bring dashi stock to a gentle simmer in a pot. Do not boil.'),
(33, 2, 'Rehydrate wakame in cold water for 5 minutes, then drain.'),
(33, 3, 'Place miso paste in a small sieve and lower it into the stock, stirring until fully dissolved.'),
(33, 4, 'Add tofu and wakame. Heat gently for 1–2 minutes without boiling.'),
(33, 5, 'Ladle into bowls and top with sliced spring onions.');

-- 34. Sweet Potato Curry
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(34, 1, 'Heat coconut oil in a large pan. Sauté onion until soft and golden, about 7 minutes.'),
(34, 2, 'Add garlic, ginger, and curry powder. Cook for 2 minutes.'),
(34, 3, 'Add sweet potato and chickpeas, stirring to coat in the spices.'),
(34, 4, 'Pour in coconut milk and crushed tomatoes. Bring to a simmer.'),
(34, 5, 'Cover and cook for 20–25 minutes until sweet potato is tender.'),
(34, 6, 'Stir in spinach and cook until wilted. Squeeze over lime juice and season with salt.'),
(34, 7, 'Serve over basmati rice, topped with cilantro.');

-- 35. Bruschetta
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(35, 1, 'Combine diced tomatoes, minced garlic, red onion, and basil in a bowl.'),
(35, 2, 'Drizzle with olive oil and balsamic vinegar. Season with salt and pepper. Let marinate for 15 minutes.'),
(35, 3, 'Grill or toast baguette slices until golden and crisp on both sides.'),
(35, 4, 'Rub one side of each toast with the cut side of the halved garlic clove.'),
(35, 5, 'Top with the tomato mixture and serve immediately.');

-- 36. Beef Chili
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(36, 1, 'Brown ground beef in a large pot over medium-high heat, breaking it up. Drain fat.'),
(36, 2, 'Add onion and bell pepper to the pot and cook until softened, about 5 minutes.'),
(36, 3, 'Stir in garlic, chili powder, cumin, and paprika. Cook for 1 minute.'),
(36, 4, 'Add diced tomatoes, tomato paste, and beef broth. Stir to combine.'),
(36, 5, 'Add kidney beans. Bring to a boil, then reduce heat and simmer uncovered for 30–40 minutes.'),
(36, 6, 'Season with salt. Serve topped with sour cream and cheddar.');

-- 37. Oatmeal Cookies
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(37, 1, 'Preheat oven to 175°C (350°F). Line baking sheets with parchment.'),
(37, 2, 'Beat butter and both sugars until creamy. Beat in eggs and vanilla.'),
(37, 3, 'Whisk flour, baking soda, cinnamon, and salt in a separate bowl.'),
(37, 4, 'Stir flour mixture into the butter mixture until just combined.'),
(37, 5, 'Fold in oats and raisins.'),
(37, 6, 'Drop rounded tablespoons of dough onto sheets 2 inches apart and flatten slightly.'),
(37, 7, 'Bake 10–12 minutes until edges are golden. Cool on the pan for 5 minutes.');

-- 38. Tom Yum Soup
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(38, 1, 'Bring broth to a boil. Add lemongrass, galangal, and kaffir lime leaves. Simmer for 5 minutes.'),
(38, 2, 'Add mushrooms and cook for 3 minutes.'),
(38, 3, 'Add shrimp and cook until pink and curled, about 2 minutes.'),
(38, 4, 'Remove from heat. Stir in fish sauce, lime juice, sugar, and Thai chilies.'),
(38, 5, 'Taste and adjust seasoning — it should be hot, sour, and salty.'),
(38, 6, 'Remove lemongrass and galangal before serving. Garnish with fresh cilantro.');

-- 39. Eggs Benedict
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(39, 1, 'Make hollandaise: whisk egg yolks and lemon juice in a heatproof bowl over simmering water until thickened.'),
(39, 2, 'Slowly whisk in melted butter until sauce is thick and smooth. Season with salt and cayenne. Keep warm.'),
(39, 3, 'Bring a wide pan of water to a gentle simmer and add white vinegar.'),
(39, 4, 'Crack eggs one at a time into the water, cooking 3–4 minutes until whites are set but yolks are runny.'),
(39, 5, 'Pan-fry Canadian bacon in butter until heated through.'),
(39, 6, 'Place bacon on toasted muffin halves. Top with a poached egg and spoon over hollandaise.'),
(39, 7, 'Garnish with chives, black pepper, and a dash of cayenne. Serve immediately.');

-- 40. Vegetable Fried Rice
INSERT INTO directions (recipe_id, step_number, instruction) VALUES
(40, 1, 'Make sure rice is cold and broken up (day-old rice works best to prevent clumping).'),
(40, 2, 'Heat vegetable oil in a wok over high heat until smoking.'),
(40, 3, 'Add garlic and stir-fry for 30 seconds.'),
(40, 4, 'Add peas, carrots, and corn, stir-frying for 2 minutes.'),
(40, 5, 'Push vegetables to the side, scramble eggs in the wok, then toss everything together.'),
(40, 6, 'Add rice and stir-fry, tossing constantly, for 3–4 minutes until heated through.'),
(40, 7, 'Drizzle with soy sauce and sesame oil. Toss well and top with spring onions. Serve immediately.');
