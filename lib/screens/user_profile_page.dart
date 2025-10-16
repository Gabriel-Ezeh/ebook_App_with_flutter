import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            fontFamily: 'ClashDisplay',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              // Upper part (white background)
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.15,
                        backgroundImage: AssetImage('assets/images/users/Stella_Mars.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Stella Mars',
                        style: TextStyle(
                          fontFamily: 'ClashDisplay',
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '@stella241',
                        style: TextStyle(
                          fontFamily: 'ClashDisplay',
                          fontSize: screenWidth * 0.04,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Lower part (grey background)
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      // Statistics
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStatCard('1,050', 'Following', screenWidth),
                            _buildStatCard('224', 'Followers', screenWidth),
                            _buildStatCard('12', 'Bookmark', screenWidth),
                          ],
                        ),
                      ),
                      // "My Restaurant" Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.01),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'My Restaurant',
                            style: TextStyle(
                              fontFamily: 'ClashDisplay',
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      // Restaurant Cards (Scrollable)
                      SizedBox(height: 2,),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildRestaurantCard('Sublimotion', 'assets/images/resturants/sublim.jpg', '9.0', screenWidth),
                              SizedBox(width: 15),
                              _buildRestaurantCard('Binh Hung', 'assets/images/resturants/Atlas.png', '9.0', screenWidth),
                              SizedBox(width: 15),
                              _buildRestaurantCard('Binh Hung', 'assets/images/resturants/Atlas.png', '9.0', screenWidth),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Follow button in the middle of both sections
          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth / 2 - 60,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              icon: Icon(Icons.person_add_alt_1, color: Colors.white),
              label: Text(
                'Follow',
                style: TextStyle(
                  fontFamily: 'ClashDisplay',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label, double screenWidth) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                fontFamily: 'ClashDisplay',
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'ClashDisplay',
                fontSize: screenWidth * 0.04,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(String name, String imagePath, String rating, double screenWidth) {
    return Container(
      width: screenWidth * 0.4,
      height: screenWidth * 0.6,
      margin: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  height: screenWidth * 0.3,
                  width: screenWidth * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.0),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'ClashDisplay',
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Restaurant',
                      style: TextStyle(
                        fontFamily: 'ClashDisplay',
                        fontSize: screenWidth * 0.035,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: screenWidth * 0.3 - 10,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                rating,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
