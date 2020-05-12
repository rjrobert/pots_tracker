import 'package:flutter/widgets.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pots_trackr/app/router.gr.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({@required String email, @required String password}) async {
    var result = await runBusyFuture(_authenticationService.loginWithEmail(
        email: email, password: password));

    return _postSignIn(result);
  }

  Future loginWithGoogle() async {
    var result = await runBusyFuture(_authenticationService.loginWithGoogle());

    return _postSignIn(result);
  }

  Future loginAnonymously() async {
    var result = await runBusyFuture(_authenticationService.loginAnonymously());

    return _postSignIn(result);
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpViewRoute);
  }

  Future _postSignIn(dynamic result) async {
    if (result is bool) {
      if (result)
        _navigationService.replaceWith(Routes.homeViewRoute);
      else
        await _dialogService.showDialog(
            title: 'Login Failure',
            description: 'General login failure. Please try again later');
    } else
      await _dialogService.showDialog(
          title: 'Login Failure', description: result);
  }
}
