import 'package:flutter/material.dart';
import 'package:xandar/auth.dart';
import 'package:xandar/login_screen.dart';
import 'package:xandar/user_screen.dart';


/// The main entry point to the app.
void main() async {
  Auth firebaseAuth = new Auth();
  Widget _defaultHome;

  if (firebaseAuth.isUserSignedIn()) {
   _defaultHome = new LoginScreen(auth: firebaseAuth);;
  } else {
    _defaultHome = new UserScreen(auth: firebaseAuth);
  }


  runApp(new MaterialApp(
    title: 'Xandar',
    home: _defaultHome,
  ));

}
