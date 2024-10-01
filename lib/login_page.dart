import 'package:ebook_app_with_flutter/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import the Font Awesome package
import 'package:ebook_app_with_flutter/customcurveclipper.dart'; // Import custom curve clipper

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The white background (bottom part)
          Container(
            color: Colors.white,
          ),
          // The green curved top part
          ClipPath(
            clipper: CustomCurveClipper(),
            child: Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height * 0.6, // Adjust this for the height of the curve
            ),
          ),
          // Add your other widgets like logo or buttons here
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150), // Space to position the content
                Image.asset(
                  'assets/images/Logo/Logo.png', // Replace the text with actual logo
                  height: 300, // Adjust the size as needed
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40), // Space between the logo and buttons

                // Google button with Font Awesome icon
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to HomePage on button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.red), // Google icon from Font Awesome
                  label: Text(
                    'Continue with Google',
                    style: TextStyle(fontFamily: 'ClashDisplay'),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Button background color
                    elevation: 4, // Add shadow effect
                    shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                ),
                SizedBox(height: 10), // Space between buttons

                // Facebook button with Font Awesome icon
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white), // Facebook icon from Font Awesome
                  label: Text(
                    'Continue with Facebook',
                    style: TextStyle(fontFamily: 'ClashDisplay'),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Button background color
                    elevation: 4, // Add shadow effect
                    shadowColor: Colors.black.withOpacity(0.25), // Customize shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                ),
                //SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to ',
                      style: TextStyle(
                        fontFamily: 'ClashDisplay',
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(
                            fontFamily: 'ClashDisplay',
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            fontFamily: 'ClashDisplay',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            fontFamily: 'ClashDisplay',
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
