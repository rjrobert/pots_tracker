import 'package:pots_trackr/app/router.gr.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void signOut() {
    setBusy(true);
    _authenticationService.signOut();
    setBusy(false);
    _navigationService.replaceWith(Routes.loginViewRoute);
  }
}
