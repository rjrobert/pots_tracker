import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:pots_trackr/core/services/firebase.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Firebase())
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Firebase, AuthenticationService>(
      update: (context, firebase, authenticationService) =>
          AuthenticationService(firebaseService: firebase))
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<FirebaseUser>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  )
];
