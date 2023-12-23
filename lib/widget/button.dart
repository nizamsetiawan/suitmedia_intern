import 'package:flutter/material.dart';
import 'package:internsuitmedia_palindromecheck/constant/colors.dart';

class ReusableButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  ReusableButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 310,
        height: 41,
        decoration: BoxDecoration(
          color: primary, // Sesuaikan warna sesuai kebutuhan
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
