import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pots_trackr/core/models/journal_entry.dart';
import 'package:pots_trackr/core/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _journalEntriesCollectionReference =
      Firestore.instance.collection('journalEntries');
  final StreamController<List<JournalEntry>> _entriesController =
      StreamController<List<JournalEntry>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromJson(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToJournalEntries(String userId) {
    _journalEntriesCollectionReference
        .where('userId', isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var newEntries = snapshot.documents
            .map((doc) => JournalEntry.fromJson(doc.data))
            .toList();

        _entriesController.add(newEntries);
      }
    });

    return _entriesController.stream;
  }
}
