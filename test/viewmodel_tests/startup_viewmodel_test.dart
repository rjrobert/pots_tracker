import 'package:mockito/mockito.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/app/router.gr.dart';
import 'package:pots_trackr/core/viewmodels/views/startup_view_model.dart';
import 'package:test/test.dart';

import '../setup/test_helpers.dart';

void main() {
  group('StartupViewModelTest - ', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('handleStartupLogic - ', () {
      test('When called should check isUserLoggedIn on AuthenticationService',
          () async {
        var authenticationService = getAndRegisterAuthenticationServiceMock();
        var model = StartUpViewModel(
          authenticationService: authenticationService,
          navigationService: locator<NavigationServiceMock>(),
        );
        await model.handleStartupLogic();
        verify(authenticationService.isUserLoggedIn());
      });

      test(
          'When called and isUserLoggedIn() returns true, should call replaceWith Routes.homeView',
          () async {
        var navigationService = getAndRegisterNavigationServiceMock();
        var model = StartUpViewModel(
          authenticationService: locator<AuthenticationServiceMock>(),
          navigationService: navigationService,
        );
        await model.handleStartupLogic();
        verify(navigationService.replaceWith(Routes.homeView));
      });

      test(
          'When called and isUserLoggedIn() returns false, should call replaceWith Routes.loginView',
          () async {
        var authenticationService =
            getAndRegisterAuthenticationServiceMock(isUserLoggedIn: false);
        var navigationService = getAndRegisterNavigationServiceMock();
        var model = StartUpViewModel(
          authenticationService: authenticationService,
          navigationService: navigationService,
        );
        await model.handleStartupLogic();
        verify(navigationService.replaceWith(Routes.loginView));
      });
    });
  });
}
