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

class Metric {
  final String userId;
  final double heartRate;
  final String bloodPressure;

  Metric({this.userId, this.heartRate, this.bloodPressure});

  Metric.fromData(Map<String, dynamic> data)
      : userId = data['userId'],
        heartRate = data['heartRate'],
        bloodPressure = data['bloodPressure'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'heartRate': heartRate,
        'bloodPressure': bloodPressure
      };
}
