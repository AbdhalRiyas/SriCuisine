class User {
  final String? id;
  final String? userName;
  final String? email;
  final String? password;
  final List<String>? allergens;
  final double? height;
  final double? weight;
  final String? gender;

  User(
      {this.id,
      this.userName,
      this.email,
      this.password,
      this.allergens,
      this.height,
      this.weight,
      this.gender});

  List<User> users = [
    User(
        id: '1',
        userName: 'John Doe',
        email: "johndoe@gmail.com",
        password: "john123",
        allergens: ["Peanuts", "Gluten"],
        height: 1.80,
        weight: 80.0,
        gender: "Male"
    ),

    User(
        id: '2',
        userName: 'Jane Doe',
        email: "janedoegmail.com",
        password: "jane123",
        allergens: ["Peanuts", "Gluten"],
        height: 1.60,
        weight: 60.0,
        gender: "Female"
    )
  ];
}
