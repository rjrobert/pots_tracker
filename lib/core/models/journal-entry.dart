class JournalEntry {
  final String entryId;
  final String userId;
  final List<String> symptoms;

  JournalEntry({this.entryId, this.userId, this.symptoms});

  JournalEntry.fromData(Map<String, dynamic> data)
      : entryId = data['entryId'],
        userId = data['userId'],
        symptoms = data['symptoms'];

  Map<String, dynamic> toJson() =>
      {'entryId': entryId, 'userId': userId, 'symptoms': symptoms};
}
