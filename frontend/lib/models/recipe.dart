class Recipe {
 final String? name;
 final String? image;
 final double? cal;
 final double? time;
 final double? rate;
 final int? reviews;
 final bool? isLiked;

  Recipe({
     this.name,
     this.image,
     this.cal,
     this.time,
     this.rate,
     this.reviews,
     this.isLiked,
  });
}

final List<Recipe> recipes = [
  Recipe(
    name: "Spicy Ramen Noodles",
    image: "assets/images/ramen-noodles.jpg",
    cal: 120,
    time: 15,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
  ),
  Recipe(
    name: "Beef Steak",
    image: "assets/images/beaf-steak.jpg",
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: true,
  ),
  Recipe(
    name: "Butter Chicken",
    image: "assets/images/butter-chicken.jpg",
    cal: 130,
    time: 18,
    rate: 4.2,
    reviews: 10,
    isLiked: false,
  ),
  Recipe(
    name: "French Toast",
    image: "assets/images/french-toast.jpg",
    cal: 110,
    time: 16,
    rate: 4.6,
    reviews: 90,
    isLiked: true,
  ),
  Recipe(
    name: "Dumplings",
    image: "assets/images/dumplings.jpg",
    cal: 150,
    time: 30,
    rate: 4.0,
    reviews: 76,
    isLiked: false,
  ),
  Recipe(
    name: "Mexican Pizza",
    image: "assets/images/mexican-pizza.jpg",
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
  ),
];
