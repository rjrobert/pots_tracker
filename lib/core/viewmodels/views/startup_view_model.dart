import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pots_trackr/app/router.gr.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;
  final NavigationService _navigationService;
  StartUpViewModel({
    AuthenticationService authenticationService,
    NavigationService navigationService,
  })  : _authenticationService =
            authenticationService ?? locator<AuthenticationService>(),
        _navigationService = navigationService ?? locator<NavigationService>();

  Future handleStartupLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (!hasLoggedInUser) await _authenticationService.loginAnonymously();

    _navigationService.replaceWith(Routes.homeView);
  }
}
