import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xandar/auth.dart';
import 'package:xandar/login_screen.dart';

// The first screen a user sees after logging in.
class UserScreen extends StatelessWidget {

  final Auth auth;

  UserScreen({Key key, @required this.auth}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new LoginScreen(auth: auth)),
            );
          },
          child: Text('Log Out!'),
        ),
      ),
    );
  }
}