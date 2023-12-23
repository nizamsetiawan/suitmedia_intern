import 'package:flutter/material.dart';
import 'package:internsuitmedia_palindromecheck/constant/colors.dart';
import 'package:internsuitmedia_palindromecheck/model/palindrome_model.dart';

class PalindromeController {
  final PalindromeModel _model = PalindromeModel();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  void checkPalindrome(BuildContext context) {
    String sentence = sentenceController.text;
    bool isPalindrome = _model.isPalindrome(sentence);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Result',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: Text(
            isPalindrome ? 'isPalindrome' : 'not palindrome',
            style: TextStyle(fontWeight: FontWeight.w500, color: dark),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(fontSize: 12, color: accent),
              ),
            ),
          ],
        );
      },
    );
  }
}
