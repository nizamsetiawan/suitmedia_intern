import 'package:flutter/material.dart';
import 'package:internsuitmedia_palindromecheck/constant/colors.dart';
import 'package:internsuitmedia_palindromecheck/controller/user_c.dart';
import 'package:internsuitmedia_palindromecheck/model/usermodel.dart';
import 'package:internsuitmedia_palindromecheck/widget/button.dart';

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  String userName;

  SecondScreen({required this.userName});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final UserController _controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Second Screen',
          style:
              TextStyle(color: dark, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: accent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  '${widget.userName}',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 250),
              child: Center(
                child: widget.userName.isNotEmpty
                    ? Text(
                        '${widget.userName}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: dark,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Selected User Name",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: dark,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
            Spacer(),
            Center(
              child: ReusableButton(
                buttonText: 'Choose a User',
                onPressed: () async {
                  final selectedUser =
                      await Navigator.pushNamed(context, '/third');
                  if (selectedUser != null && selectedUser is User) {
                    _controller.updateUserName(selectedUser.firstName);
                    setState(() {
                      widget.userName = selectedUser.firstName;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
