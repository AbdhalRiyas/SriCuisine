import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/available_ingredients_screen.dart';
import 'package:flutter_application_1/pages.dart/home_page.dart';
import 'package:flutter_application_1/pages.dart/profile_page.dart';
import 'package:flutter_application_1/pages.dart/recipes_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      body: HomePage(),
    ),
    Scaffold(
      body: RecipesPage(),
    ),
    Scaffold(
      body: AvailableIngredientsScreen(),
    ),
    Scaffold(
      body: ProfilePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.yellow,
      //   title: const Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.restaurant),
      //         SizedBox(width: 10),
      //         Text('SriCuisine')
      //       ]),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            gap: 15,
            backgroundColor: Colors.black,
            color: Colors.yellow,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.yellow.shade100,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.restaurant_menu,
                text: 'Recipes',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Ingredients',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
