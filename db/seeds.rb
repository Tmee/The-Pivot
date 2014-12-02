rachel  = User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", password_confirmation: "password",)
jeff    = User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", password_confirmation: "password", full_name: "j3")
jorge   = User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", password_confirmation: "password", full_name: "novohispano")
josh    = User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", password: "password", password_confirmation: "password", full_name: "josh", admin: true)

appetizers      = Category.create(title: "Appetizers")
sushi           = Category.create(title: "Sushi")
rolls           = Category.create(title: "Rolls")
specialty_rolls = Category.create(title: "Specialty Rolls")
vegetarian      = Category.create(title: "Vegetarian")
dairy_free      = Category.create(title: "Dairy Free")
tempura         = Category.create(title: "Tempura")
drinks          = Category.create(title: "Drinks")

tuna_poke = appetizers.menu_items.create!(title: "Tuna Poke", description: "tuna cubes, avocado, seaweed, togarashi", price: 995)
appetizers.menu_items.create!(title: "Miso Soup", description: "dashi, bonito, tofu", price: 5467)
appetizers.menu_items.create!(title: "Fried Octopus", description: "baby octopus, sesame, ginger, soy sauce, light fried", price: 4995)
appetizers.menu_items.create!(title: "Edamame", description: "soy beans, soy sauce, togarashi", price: 1995)
appetizers.menu_items.create!(title: "Tempura Veggies", description: "cauliflowers, carrots, sweet potato, broccoli", price: 5995)
seaweed_salad = appetizers.menu_items.create!(title: "Seaweed Salad", description: "seaweed, soy sauce, scallions, ginger, cilantro, pepper flakes", price: 3241)

sushi.menu_items.create!(title: "Tuna", description: "blank description", price: 1247)
sushi.menu_items.create!(title: "Spicy Tuna", description: "blank description", price: 2903)
sushi.menu_items.create!(title: "Fatty Tuna", description: "blank description", price: 3981)
sushi.menu_items.create!(title: "Salmon", description: "blank description", price: 7507)
sushi.menu_items.create!(title: "Yellowtail", description: "blank description", price: 5917)
sushi.menu_items.create!(title: "Mackerel", description: "blank description", price: 391)
sushi.menu_items.create!(title: "Eel", description: "blank description", price: 1689)

rolls.menu_items.create!(title: "California roll", description: "crab meat, cucumber, avocado", price: 917)
rolls.menu_items.create!(title: "Spider roll", description: "soft shell crab, daikon, cucumber, avocado, spicy mayonnaise", price: 7112)
rolls.menu_items.create!(title: "Philadelphia roll", description: "salmon, cream cheese, cucumber", price: 6556)
rolls.menu_items.create!(title: "Spicy tuna roll", description: "spicy tuna, sriracha mayonnaise, avocado", price: 1246)
rolls.menu_items.create!(title: "Shrimp tempura roll", description: "shrimp tempura, cucumber, ginger, yuzu", price: 4615)
rolls.menu_items.create!(title: "Lobster tempura roll", description: "lobster tempura, crab, sriracha mayo, avocado", price: 379)
vegetable_tempura_roll = rolls.menu_items.create!(title: "Vegetable tempura roll", description: "califlower, sweet potato, zucchini, cucumber, yuzu", price: 3278)

specialty_rolls.menu_items.create!(title: "Dragon roll", description: "eel, crab, avocado, topped with tuna and salmon, eel sauce", price: 3530)
specialty_rolls.menu_items.create!(title: "Volcano roll", description: "spicy tuna, crab, salmon, ginger, spicy mayo, topped with crunch flakes.", price: 7133)
specialty_rolls.menu_items.create!(title: "Orgasm roll", description: "tuna, crab, yellowtail, avocado, cream cheese, spicy mayo, entire roll is deep fried", price: 1292)
specialty_rolls.menu_items.create!(title: "Big bang roll", description: "tuna, white tuna, shrimp, yellowtail, salmon, crab, avocado, jalapeno, topped with fresh water eel", price: 4712)
specialty_rolls.menu_items.create!(title: "Rainbow roll", description: "crab, seabass, cucumber, and avocado topped with salmon and tuna", price: 3479)
specialty_rolls.menu_items.create!(title: "Spicy tofu cream cheese roll", description: "tofu tempura, cream cheese, avocado, crunch, spicy mayo", price: 4308)
specialty_rolls.menu_items.create!(title: "Surf and turf roll", description: "lobster, crab, avocado, spicy mayo, topped with seared kobe beef", price: 6426)

vegetarian.menu_items << seaweed_salad
vegetarian.menu_items << vegetable_tempura_roll
vegetarian.menu_items.create!(title: "Spicy tofu cream cheese roll", description: "tofu tempura, cream cheese, avocado, crunch, spicy mayo", price: 4308)

miso_soup = dairy_free.menu_items.create!(title: "Miso Soup", description: "dashi, bonito, tofu", price: 5467)
dairy_free.menu_items.create!(title: "Edamame", description: "soy beans, soy sauce, togarashi", price: 1995)
dairy_free.menu_items << seaweed_salad

tempura.menu_items.create!(title: "Shrimp tempura roll", description: "shrimp tempura, cucumber, ginger, yuzu", price: 4615)
tempura.menu_items.create!(title: "Lobster tempura roll", description: "lobster tempura, crab, sriracha mayo, avocado", price: 379)
tempura.menu_items.create!(title: "Vegetable tempura roll", description: "califlower, sweet potato, zucchini, cucumber, yuzu", price: 3278)

drinks.menu_items.create!(title: "Asahi beer", description: "blank description", price: 5516)
sapporo_beer = drinks.menu_items.create!(title: "Sapporo beer", description: "blank description", price: 5629)
drinks.menu_items.create!(title: "Kirin beer", description: "blank description", price: 5378)
drinks.menu_items.create!(title: "Chang beer", description: "blank description", price: 5530)
drinks.menu_items.create!(title: "Momokawa sake", description: "blank description", price: 6204)
drinks.menu_items.create!(title: "Junmai sake", description: "blank description", price: 1517)
drinks.menu_items.create!(title: "Daiginjo sake", description: "blank description", price: 6018)
drinks.menu_items.create!(title: "Ginjo sake", description: "blank description", price: 7950)
plum_wine = drinks.menu_items.create!(title: "Plum wine", description: "blank description", price: 1757)
tea = drinks.menu_items.create!(title: "Tea", description: "blank description", price: 2717)

jorge.orders.create do |order|
  order.order_menu_items.build(menu_item: tea)
  order.order_menu_items.build(menu_item: plum_wine, quantity: 3)
  order.order_menu_items.build(menu_item: miso_soup, quantity: 3)
end

josh.orders.create do |order|
  order.order_menu_items.build(menu_item: sapporo_beer, quantity: 6)
  order.order_menu_items.build(menu_item: tuna_poke, quantity: 7)
  order.order_menu_items.build(menu_item: miso_soup, quantity: 5)
end
