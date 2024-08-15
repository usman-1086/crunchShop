import 'package:cruchshop/utils/widht_height.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.obscureText=false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a TextFormField inside a Container with fixed height
          Container(
            height: WidthHeight(context).height * 0.07,
            child: TextFormField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: obscureText,
              style: TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: validator, // Validator for TextFormField
            ),
          ),

        ],
      ),
    );
  }
}
