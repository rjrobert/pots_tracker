class JournalEntry {
  final String entryId;
  final String userId;
  final DateTime createdAt;

  JournalEntry({this.entryId, this.userId, this.createdAt});

  JournalEntry.fromData(Map<String, dynamic> data)
      : entryId = data['entryId'],
        userId = data['userId'],
        createdAt = data['createdAt'].toDate();

  Map<String, dynamic> toJson() => {
        'entryId': entryId,
        'userId': userId,
        'createdAt': createdAt,
      };
}

class Metric {
  final String userId;
  final double heartRate;
  final String bloodPressure;
  final List<String> symptoms;

  Metric({this.userId, this.heartRate, this.bloodPressure, this.symptoms});

  Metric.fromData(Map<String, dynamic> data)
      : userId = data['userId'],
        heartRate = data['heartRate'],
        bloodPressure = data['bloodPressure'],
        symptoms = data['symptoms'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'heartRate': heartRate,
        'bloodPressure': bloodPressure,
        'symptoms': symptoms,
      };
}
