import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String type;
  final String imagePath;
  final String details;
  final double rating;
  final int stars;

  RestaurantCard({
    required this.name,
    required this.type,
    required this.imagePath,
    required this.details,
    required this.rating,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          // Add the desired onPressed functionality here
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant image
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
                      // Restaurant name
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
                      // Restaurant type
                      Text(
                        type,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'ClashDisplay',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Restaurant details
                      Text(
                        details,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Circle with rating and stars below it
            Positioned(
              top: 120,
              right: 20,
              child: Column(
                children: [
                  // Circle for the rating
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 28,
                      child: Text(
                        rating.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5), // Space between circle and stars
                  // Star ratings below the circle
                  _buildStars(stars),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the star icons based on the number of stars passed
  Widget _buildStars(int stars) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
            (index) => Icon(
          index < stars ? Icons.star : Icons.star_border, // Filled or empty star
          color: Colors.orange,
          size: 20,
        ),
      ),
    );
  }
}
