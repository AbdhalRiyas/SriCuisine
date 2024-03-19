class PopularRecipe {
  final String name;
  final String image;
  final String cal;
  final String time;
  final String servings;
  final String ingredients;
  final String instructions;
  final String course;
  final String allergens;

  PopularRecipe({
    required this.name,
    required this.image,
    required this.cal,
    required this.time,
    required this.servings,
    required this.ingredients,
    required this.instructions,
    required this.course,
    required this.allergens, 
      });
}

 List<PopularRecipe> popularrecipes = [
  PopularRecipe(
    name: "Black Chicken Curry",
    image:
        "assets/images/ramen-noodles.jpg",
    cal: '120',
    time: '15',
    servings: '5',
    ingredients: "Chicken, Black Pepper, Salt, Curry Leaves, Coconut Milk, Onions, Garlic, Ginger, Green Chilli, Coriander Leaves, Lemon Juice, Oil, Water",
    instructions: "1. Heat oil in a pan and add curry leaves, onions, garlic, ginger, green chilli and saute it for 2 minutes. 2. Add chicken, salt, black pepper and cook for 5 minutes. 3. Add coconut milk and cook for 5 minutes. 4. Add lemon juice and coriander leaves. 5. Serve hot with rice.",
    course: "Main Course",
    allergens: "None",
  ),
  PopularRecipe(
      name: "Beef Curry",
      image: "assets/images/beaf-steak.jpg",
      cal: "140",
      time: "25",
      servings: "3",
      ingredients: "Beef, Black Pepper, Salt, Curry Leaves, Coconut Milk, Onions, Garlic, Ginger, Green Chilli, Coriander Leaves, Lemon Juice, Oil, Water",
      instructions: "1. Heat oil in a pan and add curry leaves, onions, garlic, ginger, green chilli and saute it for 2 minutes. 2. Add beef, salt, black pepper and cook for 5 minutes. 3. Add coconut milk and cook for 5 minutes. 4. Add lemon juice and coriander leaves. 5. Serve hot with rice.",
      course: "Main Course",
      allergens: "None",
      ),
  PopularRecipe(
    name: "Crab Curry",
    image: "assets/images/butter-chicken.jpg",
    cal: "130",
    time: "18",
    servings: "4",
    ingredients: "Crab, Black Pepper, Salt, Curry Leaves, Coconut Milk, Onions, Garlic, Ginger, Green Chilli, Coriander Leaves, Lemon Juice, Oil, Water",
    instructions: "1. Heat oil in a pan and add curry leaves, onions, garlic, ginger, green chilli and saute it for 2 minutes. 2. Add crab, salt, black pepper and cook for 5 minutes. 3. Add coconut milk and cook for 5 minutes. 4. Add lemon juice and coriander leaves. 5. Serve hot with rice.",
    course: "Main Course",
    allergens: "Crustaceans",
  ),
  PopularRecipe(
      name: "Chicken And Egg Soup",
      image: "assets/images/french-toast.jpg",
      cal: "110",
      time: "16",
      servings: "4",
      ingredients: "Chicken, Egg, Black Pepper, Salt, Curry Leaves, Coconut Milk, Onions, Garlic, Ginger, Green Chilli, Coriander Leaves, Lemon Juice, Oil, Water",
      instructions: "1. Heat oil in a pan and add curry leaves, onions, garlic, ginger, green chilli and saute it for 2 minutes. 2. Add chicken, salt, black pepper and cook for 5 minutes. 3. Add coconut milk and cook for 5 minutes. 4. Add lemon juice and coriander leaves. 5. Serve hot with rice.",
      course: "Main Course",
      allergens: "Eggs",
),
  PopularRecipe(
      name: "Coconut Rice Recipe",
      image: "assets/images/dumplings.jpg",
      cal: "100",
      time: "20",
      servings: "4",
      ingredients: "Rice, Coconut, Black Pepper, Salt, Curry Leaves, Coconut Milk, Onions, Garlic, Ginger, Green Chilli, Coriander Leaves, Lemon Juice, Oil, Water",
      instructions: "1. Heat oil in a pan and add curry leaves, onions, garlic, ginger, green chilli and saute it for 2 minutes. 2. Add rice, salt, black pepper and cook for 5 minutes. 3. Add coconut milk and cook for 5 minutes. 4. Add lemon juice and coriander leaves. 5. Serve hot with rice.",
      course: "Main Course",
      allergens: "None",
),
  PopularRecipe(
      name: "Broccoli Curry",
      image: "assets/images/mexican-pizza.jpg",
      cal: "90",
      time: "15",
      servings: "4",
      ingredients: "Broccoli, Black Pepper, Salt, Curry Leaves, Coconut Milk, Onions, Garlic, Ginger, Green Chilli, Coriander Leaves, Lemon Juice, Oil, Water",
      instructions: "1. Heat oil in a pan and add curry leaves, onions, garlic, ginger, green chilli and saute it for 2 minutes. 2. Add broccoli, salt, black pepper and cook for 5 minutes. 3. Add coconut milk and cook for 5 minutes. 4. Add lemon juice and coriander leaves. 5. Serve hot with rice.",
      course: "Main Course",
      allergens: "None",
),
];
