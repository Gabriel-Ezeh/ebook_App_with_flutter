import 'package:ebook_app_with_flutter/widgets/custom_bottom_navigation_bar.dart';
import 'package:ebook_app_with_flutter/widgets/location_button.dart';
import 'package:flutter/material.dart';

class SearchButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Restaurant',
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search input field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Washington D.C, USA',
                  prefixIcon: Icon(Icons.location_on),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Recommended for you section
              Text(
                'Recommended for you',
                style: TextStyle(
                  fontFamily: 'ClashDisplay',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              // Restaurant List
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  // Restaurant 1 - Las Vegas
                  buildRestaurantButton(
                    context,
                    'Las Vegas',
                    'assets/images/resturants/las vegas res.png',
                    'Spice up / Guests',
                    9.1,
                  ),
                  // Restaurant 2 - Stratis Hill Z
                  buildRestaurantButton(
                    context,
                    'Stratis Hill Z',
                    'assets/images/resturants/Stratis Hill Z.png',
                    'Spice up / Guests',
                    9.1,
                  ),
                  // Restaurant 3 - Atlas
                  buildRestaurantButton(
                    context,
                    'Atlas',
                    'assets/images/resturants/Atlas.png',
                    'Spice up / Guests',
                    8.9,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: LocationButton(iconSize: 80),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Helper function to build each restaurant button (as seen in the design)
  Widget buildRestaurantButton(BuildContext context, String name, String imagePath, String details, double rating) {
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

              // Positioned rating circle avatar
              Positioned(
                top: 35,
                left: 95,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20,
                    child: Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
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
