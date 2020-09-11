import 'package:mockito/mockito.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:pots_trackr/core/services/authentication_service.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class AuthenticationServiceMock extends Mock implements AuthenticationService {}

class FirestoreServiceMock extends Mock implements FirestoreService {}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationServiceMock>();
  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationServiceMock>(service);
  return service;
}

DialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogServiceMock>();
  var service = DialogServiceMock();
  locator.registerSingleton<DialogServiceMock>(service);
  return service;
}

AuthenticationService getAndRegisterAuthenticationServiceMock({
  bool isUserLoggedIn = true,
  bool loginWithEmail = true,
}) {
  _removeRegistrationIfExists<AuthenticationServiceMock>();
  var service = AuthenticationServiceMock();

  when(service.isUserLoggedIn()).thenAnswer((_) async => isUserLoggedIn);
  when(service.loginWithEmail(email: '', password: ''))
      .thenAnswer((_) async => loginWithEmail);

  locator.registerSingleton<AuthenticationServiceMock>(service);
  return service;
}

FirestoreService getAndRegisterFirestoreServiceMock() {
  _removeRegistrationIfExists<FirestoreServiceMock>();
  var service = FirestoreServiceMock();
  locator.registerSingleton<FirestoreServiceMock>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterDialogServiceMock();
  getAndRegisterAuthenticationServiceMock();
  getAndRegisterFirestoreServiceMock();
}

void unregisterServices() {
  _removeRegistrationIfExists<NavigationServiceMock>();
  _removeRegistrationIfExists<DialogServiceMock>();
  _removeRegistrationIfExists<AuthenticationServiceMock>();
  _removeRegistrationIfExists<FirestoreServiceMock>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) locator.unregister<T>();
}
