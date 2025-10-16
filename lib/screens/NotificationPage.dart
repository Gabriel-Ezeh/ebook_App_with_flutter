import 'package:ebook_app_with_flutter/screens/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:ebook_app_with_flutter/widgets/location_button.dart'; // Adjust path as needed
import 'package:ebook_app_with_flutter/widgets/custom_bottom_navigation_bar.dart'; // Adjust path as needed

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
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
        padding: EdgeInsets.all(16.0),
        children: [
          // Add buttons instead of cards
          NotificationButton(
            iconPath: 'assets/images/icons/EventDateSetIcon.png',
            title: 'Event Date Set',
            subtitle: 'Calendar',
            onTap: () {
              // Handle tap action
            },
          ),
          NotificationButton(
            iconPath: 'assets/images/icons/LocationSnapshotIcon.png',
            title: 'Location Snapshot',
            subtitle: 'Snapshot',
            onTap: () {
              // Handle tap action
            },
          ),
          NotificationButton(
            iconPath: 'assets/images/icons/LocationFoundIcon.png',
            title: 'Location Found',
            subtitle: 'Map',
            onTap: () {
              // Handle tap action
            },
          ),
          // Specify a custom icon size for this button
          NotificationButton(
            iconPath: 'assets/images/icons/ExploreNewPlacesIcon.png',
            title: 'Explore New Places',
            subtitle: 'Explore',
            iconSize: 100.0, // Adjust the size of this specific icon
            onTap: () {
              // Handle tap action
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Custom navigation bar
      floatingActionButton: LocationButton(iconSize: 80),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NotificationButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Function()? onTap; // Add a function for tap handling
  final double iconSize; // New parameter for icon size

  const NotificationButton({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconSize = 100.0, // Default size for icons
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 12.0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onTap, // Action when button is pressed
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Use Image instead of SvgPicture for PNG
            Image.asset(
              iconPath,
              width: iconSize, // Use the specified icon size
              height: iconSize, // Use the specified icon size
            ),
            SizedBox(width: 16.0), // Space between icon and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
