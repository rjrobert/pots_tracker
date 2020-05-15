import 'package:pots_trackr/app/router.gr.dart';
import 'package:pots_trackr/core/models/user.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User get currentUser => _authenticationService.currentUser;

  void signOut() {
    setBusy(true);
    _authenticationService.signOut();
    setBusy(false);
    _navigationService.replaceWith(Routes.loginViewRoute);
  }

  Future getJournalEntries() async {
    setBusy(true);
    var entries = await _firestoreService.getJournalEntries(currentUser.id);
    setBusy(false);

    return entries;
  }
}
