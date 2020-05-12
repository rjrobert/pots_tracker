import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pots_trackr/core/models/user.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:pots_trackr/app/locator.dart';

class AuthenticationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.accessToken, accessToken: googleAuth.idToken);

      var authResult = await _firebaseAuth.signInWithCredential(credential);

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future loginAnonymously() async {
    try {
      var authResult = await _firebaseAuth.signInAnonymously();

      _currentUser = User(id: authResult.user.uid);
      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail(
      {@required String email,
      @required String password,
      String fullName = ''}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser =
          User(id: authResult.user.uid, email: email, fullName: fullName);
      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) _currentUser = await _firestoreService.getUser(user.uid);
  }
}
