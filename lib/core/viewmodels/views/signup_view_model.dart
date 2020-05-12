import 'package:flutter/material.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pots_trackr/app/router.gr.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp(
      {@required String email,
      @required String password,
      String fullName}) async {
    var result = await runBusyFuture(_authenticationService.signUpWithEmail(
        email: email, password: password, fullName: fullName));

    if (result is bool) {
      if (result)
        _navigationService.replaceWith(Routes.homeViewRoute);
      else
        await _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'General sign up failure. Please try again later.');
    } else
      await _dialogService.showDialog(
          title: 'Sign Up Failure', description: result);
  }
}
