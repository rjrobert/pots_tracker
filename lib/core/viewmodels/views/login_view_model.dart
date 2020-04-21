import 'package:flutter/widgets.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/core/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login() async {
    setBusy(true);
    var success = await _authenticationService.login();
    setBusy(false);
    return success;
  }
}
