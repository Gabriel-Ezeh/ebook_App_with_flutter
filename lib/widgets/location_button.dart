 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationButton extends StatelessWidget {
  final double iconSize;

  const LocationButton({required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: iconSize + 70,
      height: iconSize + 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Move both circles together
          Positioned(
            bottom: -10, // Adjust this value to move both circles down
            child: Container(
              width: iconSize + 30,
              height: iconSize + 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.5), // Transparent outer circle
              ),
              child: Center(
                child: Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green, // Solid inner circle
                  ),
                  child: IconButton(
                    icon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.white, // Set icon color to white
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/icons/location icon sv.svg',
                        height: 54,
                        width: 54,
                      ),
                    ),
                    onPressed: () {
                      // Handle location button press here
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
