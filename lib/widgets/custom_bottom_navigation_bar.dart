import 'package:ebook_app_with_flutter/screens/BookmarkPage.dart';
import 'package:ebook_app_with_flutter/screens/NotificationPage.dart';
import 'package:ebook_app_with_flutter/screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ebook_app_with_flutter/screens/search_button_page.dart';
import 'package:ebook_app_with_flutter/providers/navigation_provider.dart'; // Import the provider

class CustomBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationProvider); // Get the selected index directly

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Icon
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icons/home-03.svg',
              color: selectedIndex == 0 ? Colors.green : Colors.black,
            ),
            onPressed: () {
              if (selectedIndex != 0) {
                ref.read(navigationProvider.notifier).state = 0; // Update the selected index
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Ensure this points to your actual home page
                      (Route<dynamic> route) => false, // Remove all previous routes
                );
              }
            },
          ),

          // Search Icon
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icons/search-02.svg',
              color: selectedIndex == 1 ? Colors.green : Colors.black,
            ),
            onPressed: () {
              if (selectedIndex != 1) {
                ref.read(navigationProvider.notifier).state = 1; // Update the selected index
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SearchButtonPage()),
                );
              }
            },
          ),

          SizedBox(width: 40), // Space for the Floating Action Button (location button)

          // Notification Icon
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icons/notification-box.svg',
              color: selectedIndex == 2 ? Colors.green : Colors.black,
            ),
            onPressed: () {
              if (selectedIndex != 2) {
                ref.read(navigationProvider.notifier).state = 2; // Update the selected index
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              }
            },
          ),

          // Marker Icon
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icons/marker-01.svg',
              color: selectedIndex == 3 ? Colors.green : Colors.black,
            ),
            onPressed: () {
              if (selectedIndex != 3) {
                ref.read(navigationProvider.notifier).state = 3; // Update the selected index
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BookmarkPage() ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
