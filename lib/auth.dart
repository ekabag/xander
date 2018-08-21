import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

/// Contains the logic to authenticate user using their GMail accounts.
class Auth {

  // Sign in the user using GMail.
  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return true;
  }

  // Returns whether or not the user is signed in. This will be used to decide
  // whether to display the log in screen or user's profile screen.
  bool isUserSignedIn() {
    return _auth.currentUser() != null;
  }

  // Logs out the user from the app.
  bool signOut() {
    _auth.signOut();
    _googleSignIn.signOut();
  }

}