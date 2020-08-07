import 'package:pots_trackr/app/router.gr.dart';
import 'package:pots_trackr/core/models/journal_entry.dart';
import 'package:pots_trackr/core/models/user.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<JournalEntry>> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User get currentUser => _authenticationService.currentUser;

  @override
  Stream<List<JournalEntry>> get stream =>
      _firestoreService.listenToJournalEntries(currentUser.id);

  void signOut() async {
    await runBusyFuture(_authenticationService.signOut());

    _navigationService.replaceWith(Routes.loginView);
  }
}
