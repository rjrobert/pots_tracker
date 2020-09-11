import 'package:mockito/mockito.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/app/router.gr.dart';
import 'package:pots_trackr/core/viewmodels/views/login_view_model.dart';
import 'package:test/test.dart';

import '../setup/test_helpers.dart';

void main() {
  group('LoginViewModelTest - ', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('login - ', () {
      test('When called should call loginWithEmail on AuthenticationService',
          () async {
        var authService = getAndRegisterAuthenticationServiceMock();
        var model = LoginViewModel(
          authenticationService: authService,
          dialogService: locator<DialogServiceMock>(),
          navigationService: locator<NavigationServiceMock>(),
        );
        await model.login(email: '', password: '');
        verify(authService.loginWithEmail(email: '', password: ''));
      });
      test('When signin is successful, should replaceWith homeView', () async {
        var navigationService = locator<NavigationServiceMock>();
        var model = LoginViewModel(
          authenticationService: locator<AuthenticationServiceMock>(),
          dialogService: locator<DialogServiceMock>(),
          navigationService: navigationService,
        );
        await model.login(email: '', password: '');
        verify(navigationService.replaceWith(Routes.homeView));
      });
      test('When signin is not successful, should show dialog with error',
          () async {
        var authService = getAndRegisterAuthenticationServiceMock(
          loginWithEmail: false,
        );
        var model = LoginViewModel(
          authenticationService: authService,
          dialogService: locator<DialogServiceMock>(),
          navigationService: locator<NavigationServiceMock>(),
        );
        await model.login(email: '', password: '');
        verify(authService.loginWithEmail(email: '', password: ''));
      });
    });
  });
}
