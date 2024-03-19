class Recipe {
  final String? name;
  final String? image;
  final int? cal;
  final int? time;
  final int? servings;
  final String? ingredients;
  final String? instructions;
  final String? allergens;
  final String? course;

  Recipe({
    this.name,
    this.image = "https://c4.wallpaperflare.com/wallpaper/373/952/839/wooden-spoon-condiments-background-wallpaper-preview.jpg",
    this.cal,
    this.time,
    this.servings,
    this.ingredients,
    this.instructions,
    this.allergens,
    this.course,
  });
}

final List<Recipe> recipes = [
  Recipe(
    name: "Spicy Ramen Noodles",
    // image: "https://c4.wallpaperflare.com/wallpaper/373/952/839/wooden-spoon-condiments-background-wallpaper-preview.jpg",
    cal: 120,
    time: 15,
    servings: 5,
    ingredients:
        "1 pack of ramen noodles, 1/2 cup of chopped vegetables, 1/4 cup of soy sauce, 1/4 cup of hot sauce, 1/4 cup of vinegar, 1/4 cup of sugar, 1/4 cup of water, 1/4 cup of oil, 1/4 cup of chopped green onions, 1/4 cup of chopped cilantro, 1/4 cup of chopped peanuts, 1/4 cup of chopped mushrooms, 1/4 cup of chopped tofu, 1/4 cup of chopped chicken, 1/4 cup of chopped beef, 1/4 cup of chopped pork, 1/4 cup of chopped shrimp, 1/4 cup of chopped fish, 1/4 cup of chopped crab, 1/4 cup of chopped lobster, 1/4 cup of chopped scallops, 1/4 cup of chopped clams, 1/4 cup of chopped oysters, 1/4 cup of chopped mussels, 1/4 cup of chopped squid, 1/4 cup of chopped octopus, 1/4 cup of chopped snails, 1/4 cup of chopped frogs, 1/4 cup of chopped turtles, 1/4 cup of chopped alligators, 1/4 cup of chopped lizards, 1/4 cup of chopped snakes, 1/4 cup of chopped birds, 1/4 cup of chopped bats, 1/4 cup of chopped rats, 1/4 cup of chopped mice, 1/4 cup of chopped rabbits, 1/4 cup of chopped squirrels, 1/4 cup of chopped chipmunks, 1/4 cup of chopped beavers, 1/4 cup of chopped otters, 1/4 cup of chopped skunks, 1/4 cup of chopped raccoons, 1/4 cup of chopped foxes, 1/4 cup of chopped wolves, 1/4 cup of chopped bears, 1/4 cup of chopped lions, 1/4 cup of chopped tigers, 1/4 cup of chopped leopards, 1/4 cup of chopped cheetahs, 1/4 cup of chopped jaguars, 1/4 cup of chopped panthers, 1/4 cup of chopped cougars",
    instructions:
        "1. Boil the ramen noodles in a pot of water for 3 minutes. 2. Drain the water from the pot. 3. Add the chopped vegetables to the pot. 4. Add the soy sauce, hot sauce, vinegar, sugar, and water to the pot. 5. Cook the ingredients in the pot for 5 minutes. 6. Add the oil to the pot. 7. Cook the ingredients in the pot for 5 minutes. 8. Add the green onions, cilantro, and peanuts to the pot. 9. Cook the ingredients in the pot for 5 minutes. 10. Add the mushrooms, tofu, chicken, beef, pork, shrimp, fish, crab, lobster, scallops, clams, oysters, mussels, squid, octopus, snails, frogs, turtles, alligators, lizards, snakes, birds, bats, rats, mice, rabbits, squirrels, chipmunks, beavers, otters, skunks, raccoons, foxes, wolves, bears, lions, tigers, leopards, cheetahs, jaguars, panthers, and cougars to the pot. 11. Cook the ingredients in the pot for 5 minutes. 12. Serve the spicy ramen noodles in a bowl.",
    allergens: "Soy, Peanuts, Shellfish, Fish, Wheat",
    course: "Main Dish",
  ),
  Recipe(
      name: "Beef Steak",
     // image: "assets/images/beaf-steak.jpg",
      cal: 140,
      time: 25,
      servings: 3,
      ingredients:
          "Beef, Salt, Pepper, Olive Oil, Garlic, Butter, Thyme, Rosemary, Parsley, Lemon Juice",
      instructions:
          "1. Season the beef with salt and pepper. 2. Heat the olive oil in a pan. 3. Add the beef to the pan. 4. Cook the beef in the pan for 5 minutes on each side. 5. Add the garlic, butter, thyme, and rosemary to the pan. 6. Cook the beef in the pan for 5 minutes. 7. Add the parsley and lemon juice to the pan. 8. Cook the beef in the pan for 5 minutes. 9. Serve the beef steak on a plate."),
  Recipe(
    name: "Butter Chicken",
   // image: "assets/images/butter-chicken.jpg",
    cal: 130,
    time: 18,
    servings: 4,
    ingredients:
        "1/2 cup of butter, 1/4 cup of chopped onions, 1/4 cup of chopped garlic, 1/4 cup of chopped ginger, 1/4 cup of chopped tomatoes, 1/4 cup of chopped cilantro, 1/4 cup of chopped chicken, 1/4 cup of chopped beef, 1/4 cup of chopped pork, 1/4 cup of chopped shrimp, 1/4 cup of chopped fish, 1/4 cup of chopped crab, 1/4 cup of chopped lobster, 1/4 cup of chopped scallops, 1/4 cup of chopped clams, 1/4 cup of chopped oysters, 1/4 cup of chopped mussels, 1/4 cup of chopped squid, 1/4 cup of chopped octopus, 1/4 cup of chopped snails, 1/4 cup of chopped frogs, 1/4 cup of chopped turtles, 1/4 cup of chopped alligators, 1/4 cup of chopped lizards, 1/4 cup of chopped snakes, 1/4 cup of chopped birds, 1/4 cup of chopped bats, 1/4 cup of chopped rats, 1/4 cup of chopped mice, 1/4 cup of chopped rabbits, 1/4 cup of chopped squirrels, 1/4 cup of chopped chipmunks, 1/4 cup of chopped beavers, 1/4 cup of chopped otters, 1/4 cup of chopped skunks, 1/4 cup of chopped raccoons, 1/4 cup of chopped foxes, 1/4 cup of chopped wolves, 1/4 cup of chopped bears, 1/4 cup of chopped lions, 1/4 cup of chopped tigers, 1/4 cup of chopped leopards, 1/4 cup of chopped cheetahs, 1/4 cup of chopped jaguars, 1/4 cup of chopped panthers, 1/4 cup of chopped cougars",
    instructions:
        "1. Melt the butter in a pan. 2. Add the onions, garlic, and ginger to the pan. 3. Cook the ingredients in the pan for 5 minutes. 4. Add the tomatoes and cilantro to the pan. 5. Cook the ingredients in the pan for 5 minutes. 6. Add the chicken, beef, pork, shrimp, fish, crab, lobster, scallops, clams, oysters, mussels, squid, octopus, snails, frogs, turtles, alligators, lizards, snakes, birds, bats, rats, mice, rabbits, squirrels, chipmunks, beavers, otters, skunks, raccoons, foxes, wolves, bears, lions, tigers, leopards, cheetahs, jaguars, panthers, and cougars to the pan. 7. Cook the ingredients in the pan for 5 minutes. 8. Serve the butter chicken on a plate.",
  ),
  Recipe(
    name: "French Toast",
   // image: "assets/images/french-toast.jpg",
    cal: 110,
    time: 16,
    servings: 4,
    ingredients: "4 slices of bread, 2 eggs",
    instructions:
        "1. Beat the eggs in a bowl. 2. Dip the bread in the eggs. 3. Fry the bread in a pan for 3 minutes on each side. 4. Serve the French toast on a plate.",
  ),
  Recipe(
    name: "Dumplings",
  //  image: "assets/images/dumplings.jpg",
    cal: 150,
    time: 30,
    servings: 6,
    ingredients:
        "1 pack of dumplings, 1/2 cup of water, 1/4 cup of oil, 1/4 cup of chopped green onions, 1/4 cup of chopped cilantro, 1/4 cup of chopped peanuts, 1/4 cup of chopped mushrooms, 1/4 cup of chopped tofu, 1/4 cup of chopped chicken, 1/4 cup of chopped beef, 1/4 cup of chopped pork, 1/4 cup of chopped shrimp, 1/4 cup of chopped fish, 1/4 cup of chopped crab, 1/4 cup of chopped lobster, 1/4 cup of chopped scallops, 1/4 cup of chopped clams, 1/4 cup of chopped oysters, 1/4 cup of chopped mussels, 1/4 cup of chopped squid, 1/4 cup of chopped octopus, 1/4 cup of chopped snails, 1/4 cup of chopped frogs, 1/4 cup of chopped turtles, 1/4 cup of chopped alligators, 1/4 cup of chopped lizards, 1/4 cup of chopped snakes, 1/4 cup of chopped birds, 1/4 cup of chopped bats, 1/4 cup of chopped rats, 1/4 cup of chopped mice, 1/4 cup of chopped rabbits, 1/4 cup of chopped squirrels, 1/4 cup of chopped chipmunks, 1/4 cup of chopped beavers, 1/4 cup of chopped otters, 1/4 cup of chopped skunks, 1/4 cup of chopped raccoons, 1/4 cup of chopped foxes, 1/4 cup of chopped wolves, 1/4 cup of chopped bears, 1/4 cup of chopped lions, 1/4 cup of chopped tigers, 1/4 cup of chopped leopards, 1/4 cup of chopped cheetahs, 1/4 cup of chopped jaguars, 1/4 cup of chopped panthers, 1/4 cup of chopped cougars",
    instructions:
        "1. Boil the dumplings in a pot of water for 5 minutes. 2. Drain the water from the pot. 3. Serve the dumplings on a plate.",
  ),
  Recipe(
    name: "Mexican Pizza",
 //   image: "assets/images/mexican-pizza.jpg",
    cal: 140,
    time: 25,
    servings: 4,
    ingredients:
        "1 pack of pizza dough, 1/2 cup of tomato sauce, 1/4 cup of chopped onions, 1/4 cup of chopped bell peppers, 1/4 cup of chopped jalapenos, 1/4 cup of chopped olives, 1/4 cup of chopped tomatoes, 1/4 cup of chopped cilantro, 1/4 cup of chopped avocado, 1/4 cup of chopped chicken, 1/4 cup of chopped beef, 1/4 cup of chopped pork, 1/4 cup of chopped shrimp, 1/4 cup of chopped fish, 1/4 cup of chopped crab, 1/4 cup of chopped lobster, 1/4 cup of chopped scallops, 1/4 cup of chopped clams, 1/4 cup of chopped oysters, 1/4 cup of chopped mussels, 1/4 cup of chopped squid, 1/4 cup of chopped octopus, 1/4 cup of chopped snails, 1/4 cup of chopped frogs, 1/4 cup of chopped turtles, 1/4 cup of chopped alligators, 1/4 cup of chopped lizards, 1/4 cup of chopped snakes, 1/4 cup of chopped birds, 1/4 cup of chopped bats, 1/4 cup of chopped rats, 1/4 cup of chopped mice, 1/4 cup of chopped rabbits, 1/4 cup of chopped squirrels, 1/4 cup of chopped chipmunks, 1/4 cup of chopped beavers, 1/4 cup of chopped otters, 1/4 cup of chopped skunks, 1/4 cup of chopped raccoons, 1/4 cup of chopped foxes, 1/4 cup of chopped wolves, 1/4 cup of chopped bears, 1/4 cup of chopped lions, 1/4 cup of chopped tigers, 1/4 cup of chopped leopards, 1/4 cup of chopped cheetahs, 1/4 cup of chopped jaguars, 1/4 cup of chopped panthers, 1/4 cup of chopped cougars",
    instructions:
        "1. Roll out the pizza dough on a baking sheet. 2. Spread the tomato sauce on the pizza dough. 3. Add the onions, bell peppers, jalapenos, olives, tomatoes, cilantro, and avocado to the pizza dough. 4. Add the chicken, beef, pork, shrimp, fish, crab, lobster, scallops, clams, oysters, mussels, squid, octopus, snails, frogs, turtles, alligators, lizards, snakes, birds, bats, rats, mice, rabbits, squirrels, chipmunks, beavers, otters, skunks, raccoons, foxes, wolves, bears, lions, tigers, leopards, cheetahs, jaguars, panthers, and cougars to the pizza dough. 5. Bake the Mexican pizza in the oven at 400 degrees for 20 minutes. 6. Serve the Mexican pizza on a plate.",
  ),
];
