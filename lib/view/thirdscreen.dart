import 'package:flutter/material.dart';
import 'package:internsuitmedia_palindromecheck/constant/colors.dart';
import 'package:internsuitmedia_palindromecheck/controller/user_c.dart';
import 'package:internsuitmedia_palindromecheck/model/usermodel.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final UserController _controller = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Third Screen',
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
      body: FutureBuilder(
        future: _controller.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<User> users = snapshot.data as List<User>;
            return _buildUserList(context, users);
          }
        },
      ),
    );
  }

  Widget _buildUserList(BuildContext context, List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        User user = users[index];
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.avatar,
                ),
                radius: 49,
              ),
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              subtitle: Text(
                user.email,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                _controller.onUserTap(context, user);
              },
            ),
            Divider(
              color: grey,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
          ],
        );
      },
    );
  }
}
