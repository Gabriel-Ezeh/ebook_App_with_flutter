import 'package:flutter/material.dart';

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from top-left corner
    path.lineTo(0.0, size.height - 100);

    // First curve towards the bottom-right
    var firstControlPoint = Offset(size.width / 2, size.height + 100);
    var firstEndPoint = Offset(size.width, size.height - 100);

    // Curve creation
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    // Right edge and top edge
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
