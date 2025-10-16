import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;

  const CategoryItem({required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          padding: const EdgeInsets.all(8.0),
        ),
        onPressed: () {}, // Add the desired onPressed functionality here
        child: Column(
          children: [
            Image.asset(
              iconPath,
              height: 50,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontFamily: 'ClashDisplay', fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
