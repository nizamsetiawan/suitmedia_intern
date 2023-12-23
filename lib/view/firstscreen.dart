import 'package:flutter/material.dart';
import 'package:internsuitmedia_palindromecheck/controller/palindrome_c.dart';
import 'package:internsuitmedia_palindromecheck/widget/button.dart';

class FirstScreen extends StatelessWidget {
  final PalindromeController _controller = PalindromeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_photo.png',
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: 310,
                        height: 41,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextField(
                          controller: _controller.nameController,
                          autocorrect: false,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 310,
                        height: 41,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextField(
                          controller: _controller.sentenceController,
                          autocorrect: false,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                            hintText: 'Polindrome',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ReusableButton(
                    buttonText: 'Check',
                    onPressed: () {
                      _controller.checkPalindrome(context);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ReusableButton(
                    buttonText: 'Next',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/second',
                        arguments: {
                          'userName': _controller.nameController.text
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
