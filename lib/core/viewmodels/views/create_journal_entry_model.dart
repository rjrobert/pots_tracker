import 'package:pots_trackr/app/locator.dart';
import 'package:pots_trackr/core/models/journal_entry.dart';
import 'package:pots_trackr/core/services/authentication_service.dart';
import 'package:pots_trackr/core/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateJournalEntryViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future addJournalEntry(
      {int heartRate, List<Map<String, int>> symptoms}) async {
    var result = await runBusyFuture(
        await _firestoreService.createJournalEntry(JournalEntry(
      userId: _authenticationService.currentUser.id,
      heartRate: heartRate,
      symptoms: symptoms,
    )));

    if (result is String)
      _dialogService.showDialog(
        title: 'Could not create entry',
        description: result,
      );
    else
      _dialogService.showDialog(
          title: 'Entry saved!', description: 'Your entry has been saved!');

    _navigationService.back();
  }
}
