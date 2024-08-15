import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width;
  final Color color;
  final String text;
  final String? assetIconPath; // Optional asset icon path
  final VoidCallback onPressed;
  final Color borderColor; // Border color
  final double borderWidth; // Border width

  const MyButton({
    super.key,
    required this.width,
    required this.color,
    required this.text,
    this.assetIconPath, // Optional asset icon path
    required this.onPressed,
    this.borderColor = Colors.transparent, // Default border color
    this.borderWidth = 0.0, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: [
            if (assetIconPath != null) ...[
              Image.asset(
                assetIconPath!,
                width: 24.0, // Adjust size as needed
                height: 24.0, // Adjust size as needed
              ),
              SizedBox(width: 8.0), // Space between icon and text
            ],
            Text(
              text,
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
