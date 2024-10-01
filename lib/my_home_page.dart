import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // The three category icons (Restaurant, Spice up, Rent a Bar)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryItem(
                  context,
                  'assets/images/icons/resturant_logo.png',
                  'Restaurant',
                ),
                _buildCategoryItem(
                  context,
                  'assets/images/icons/spice_logo.png',
                  'Spice up',
                ),
                _buildCategoryItem(
                  context,
                  'assets/images/icons/Rent_a_bar_logo.svg',
                  'Rent a Bar',
                ),
              ],
            ),
            SizedBox(height: 20),

            // Example for displaying a restaurant card
            Expanded(
              child: ListView(
                children: [
                  _buildRestaurantCard(
                    'Sublimotion',
                    'Restaurant',
                    'assets/images/resturants/sublim.jpg',
                    'Spice up / Guests / Welcome Party',
                    9.2,
                  ),
                  _buildRestaurantCard(
                    'Classic Style',
                    'Restaurant',
                    'assets/images/resturants/classic-style-restaurant-with-tables-chairs.jpg',
                    'Spice up / Guests / Welcome Party',
                    9.2,
                  ),
                  _buildRestaurantCard(
                    'Sublimotion',
                    'Restaurant',
                    'assets/images/resturants/Sublimotion_resturant.png',
                    'Spice up / Guests / Welcome Party',
                    9.2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
      floatingActionButton: _buildLocationButton(60), // Moved here
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Moved here
    );
  }

  // Helper method to build the category items with custom icons inside a button
  Widget _buildCategoryItem(BuildContext context, String iconPath, String label) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          padding: const EdgeInsets.all(8.0),
        ),
        onPressed: () {}, // Add the desired onPressed functionality here
        child: Column(
          children: [
            Image.asset(
              iconPath,
              height: 50,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontFamily: 'ClashDisplay', fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the restaurant card with added restaurant label below the name
  Widget _buildRestaurantCard(String name, String type, String imagePath, String details, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {}, // Add the desired onPressed functionality here
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    imagePath,
                    height: 150,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'ClashDisplay',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        type,  // Added the restaurant label below the name
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'ClashDisplay',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        details,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 120,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 28,
                  child: Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the custom bottom navigation bar with FontAwesome icons and the dual circle location button
  Widget _buildCustomBottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Other navigation icons
            IconButton(icon: FaIcon(FontAwesomeIcons.home, color: Colors.black), onPressed: () {}),
            IconButton(icon: FaIcon(FontAwesomeIcons.search, color: Colors.black), onPressed: () {}),

            // Placeholder for the middle location button
            SizedBox(width: 40),

            IconButton(icon: FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.black), onPressed: () {}),
            IconButton(icon: FaIcon(FontAwesomeIcons.cog, color: Colors.black), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  // Floating action button for the center (location) button with two circles
  Widget _buildLocationButton(double iconSize) {
    return Container(
      width: iconSize + 30,  // Adjust size for the button
      height: iconSize + 30,  // Adjust size for the button
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bigger outer circle with opacity (outside nav bar)
          Container(
            width: iconSize + 40,
            height: iconSize + 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withOpacity(0.2),  // Outer circle with opacity
            ),
          ),
          // Smaller inner circle (within nav bar)
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,  // Inner circle without opacity
            ),
            child: Icon(
              FontAwesomeIcons.locationArrow,
              color: Colors.white,
              size: iconSize - 10,  // Adjust icon size
            ),
          ),
        ],
      ),
    );
  }
}
