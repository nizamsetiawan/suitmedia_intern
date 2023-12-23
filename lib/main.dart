import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internsuitmedia_palindromecheck/view/firstscreen.dart';
import 'package:internsuitmedia_palindromecheck/view/secondscreen.dart';
import 'package:internsuitmedia_palindromecheck/view/thirdscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palindrome Checker App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FirstScreen(),
      routes: {
        '/second': (context) => SecondScreen(userName: ''),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}
