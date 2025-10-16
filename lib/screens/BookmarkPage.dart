import 'package:ebook_app_with_flutter/screens/menu_page.dart';
import 'package:ebook_app_with_flutter/widgets/location_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons
import 'package:ebook_app_with_flutter/widgets/custom_bottom_navigation_bar.dart'; // Adjust path as needed

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.person), // Profile icon
            onPressed: () {
              // Handle profile icon action
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: CustomDrawer()
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // Restaurant 1 - Las Vegas
          buildRestaurantButton(
            context,
            'Las Vegas',
            'assets/images/resturants/las vegas res.png', // Update the image path as needed
            'Spice up / Guests',
          ),
          // Restaurant 2 - Stratis Hill Z
          buildRestaurantButton(
            context,
            'Stratis Hill Z',
            'assets/images/resturants/Stratis Hill Z.png', // Update the image path as needed
            'Spice up / Guests',
          ),
          // Restaurant 3 - Atlas
          buildRestaurantButton(
            context,
            'Atlas',
            'assets/images/resturants/Atlas.png', // Update the image path as needed
            'Spice up / Guests',
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Custom navigation bar
      floatingActionButton: LocationButton(iconSize: 80), // Assuming you have a LocationButton widget
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Helper function to build each restaurant button (as seen in the design)
  Widget buildRestaurantButton(BuildContext context, String name, String imagePath, String details) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          // Define what happens when this card is tapped
          print('$name tapped');
        },
        child: Card(
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.2), // Shadow effect for the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  // Restaurant Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Restaurant Name
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    fontFamily: 'ClashDisplay',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              // Star Rating
                              // Star Rating - Adjusted with Transform.translate
                              Transform.translate(
                                offset: Offset(0, 30), // Move stars down without expanding the card
                                child: Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange[300], size: 18),
                                    Icon(Icons.star, color: Colors.orange[300], size: 18),
                                    Icon(Icons.star, color: Colors.orange[300], size: 18),
                                    Icon(Icons.star, color: Colors.orange[300], size: 18),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          // Restaurant type and details
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Restaurant',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              details,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Positioned marker icon circle avatar
              Positioned(
                top: 35,
                left: 95,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20,
                    child: SvgPicture.asset(
                      'assets/images/icons/bookmark icon white.svg', // Path to your marker icon
                      width: 20, // Adjust the size as needed
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
