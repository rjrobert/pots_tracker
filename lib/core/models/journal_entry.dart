import 'dart:convert';

import 'package:flutter/foundation.dart';

class JournalEntry {
  final String entryId;
  final String userId;
  final DateTime createdAt;
  final int heartRate;
  final Map<String, int> symptoms;
  JournalEntry({
    this.entryId,
    this.userId,
    this.createdAt,
    this.heartRate,
    this.symptoms,
  });

  JournalEntry copyWith({
    String entryId,
    String userId,
    DateTime createdAt,
    int heartRate,
    Map<String, int> symptoms,
  }) {
    return JournalEntry(
      entryId: entryId ?? this.entryId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      heartRate: heartRate ?? this.heartRate,
      symptoms: symptoms ?? this.symptoms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'entryId': entryId,
      'userId': userId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'heartRate': heartRate,
      'symptoms': symptoms,
    };
  }

  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return JournalEntry(
      entryId: map['entryId'],
      userId: map['userId'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      heartRate: map['heartRate'],
      symptoms: Map<String, int>.from(map['symptoms']),
    );
  }

  String toJson() => json.encode(toMap());

  factory JournalEntry.fromJson(String source) =>
      JournalEntry.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JournalEntry(entryId: $entryId, userId: $userId, createdAt: $createdAt, heartRate: $heartRate, symptoms: $symptoms)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JournalEntry &&
        o.entryId == entryId &&
        o.userId == userId &&
        o.createdAt == createdAt &&
        o.heartRate == heartRate &&
        mapEquals(o.symptoms, symptoms);
  }

  @override
  int get hashCode {
    return entryId.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        heartRate.hashCode ^
        symptoms.hashCode;
  }
}
