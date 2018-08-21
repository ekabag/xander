import 'package:flutter/material.dart';
import 'package:xandar/auth.dart';
import 'package:xandar/user_screen.dart';

// The logging in screen for users who are not logged in.
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, @required this.auth}) : super(key: key);

  final Auth auth;

  @override
  _LoginPageState createState() => new _LoginPageState(auth);
}

class _LoginPageState extends State<LoginScreen> {
  double LOGIN_PAGE_HORIZONTAL_PADDING = 16.0;

  final Auth auth;

  _LoginPageState(this.auth);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Xandar"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
                child: new Text("Sign In With Google"),
                onPressed: () {
                  auth.signInWithGoogle();
                  if (auth.isUserSignedIn()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new UserScreen(auth: auth)),
                    );
                  }
                }
            )
          ],
        ),
      ),

    );
  }

  void validateAndLoginUser() {
  }
}
