import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the new login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Use LoginPage instead of CurvedPage
    );
  }
}
