import 'package:ebook_app_with_flutter/screens/menu_page.dart';
import 'package:ebook_app_with_flutter/widgets/category_item.dart';
import 'package:ebook_app_with_flutter/widgets/custom_bottom_navigation_bar.dart';
import 'package:ebook_app_with_flutter/widgets/location_button.dart';
import 'package:ebook_app_with_flutter/widgets/restaurant_card.dart';
import 'package:ebook_app_with_flutter/screens/user_profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'ClashDisplay',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: CustomDrawer()
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Category Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(
                  iconPath: 'assets/images/icons/resturant_logo.png',
                  label: 'Restaurant',
                ),
                SizedBox(width: 25), // Adds space between the buttons
                CategoryItem(
                  iconPath: 'assets/images/icons/spice logo.png',
                  label: 'Spice up',
                ),
                SizedBox(width: 25), // Adds space between the buttons
                CategoryItem(
                  iconPath: 'assets/images/icons/Rent_a_bar_logo.svg',
                  label: 'Rent a Bar',
                ),
              ],
            ),
            SizedBox(height: 20),
            // Restaurant List
            Expanded(
              child: ListView(
                children: [
                  RestaurantCard(
                    name: 'Sublimotion',
                    type: 'Restaurant',
                    imagePath: 'assets/images/resturants/sublim.jpg',
                    details: 'Spice up / Guests / Welcome Party',
                    rating: 9.2,
                    stars: 3,
                  ),
                  RestaurantCard(
                    name: 'Classic Style',
                    type: 'Restaurant',
                    imagePath:
                        'assets/images/resturants/classic-style-restaurant-with-tables-chairs.jpg',
                    details: 'Spice up / Guests / Welcome Party',
                    rating: 9.2,
                    stars: 5,
                  ),
                  RestaurantCard(
                    name: 'Sublimotion',
                    type: 'Restaurant',
                    imagePath:
                        'assets/images/resturants/classic-style-restaurant-with-tables-chairs.jpg',
                    details: 'Spice up / Guests / Welcome Party',
                    rating: 9.2,
                    stars: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: LocationButton(iconSize: 80),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
class DrawerButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  DrawerButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'ClashDisplay',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
