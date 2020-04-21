import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:pots_trackr/core/services/firebase.dart';

class AuthenticationService {
  final Firebase _firebase;

  AuthenticationService({Firebase firebaseService})
      : _firebase = firebaseService;

  StreamController<FirebaseUser> _userController =
      StreamController<FirebaseUser>();

  Stream<FirebaseUser> get user => _userController.stream;

  Future<bool> login() async {
    var fetchedUser = await _firebase.handleSignIn();

    var hasUser = fetchedUser != null;
    if (hasUser) _userController.add(fetchedUser);

    return hasUser;
  }
}
