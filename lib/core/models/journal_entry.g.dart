// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) {
  return JournalEntry(
    entryId: json['entryId'] as String,
    userId: json['userId'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(
            json['createdAt'].millisecondsSinceEpoch,
          ),
    heartRate: json['heartRate'] as int,
    symptoms: (json['symptoms'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

Map<String, dynamic> _$JournalEntryToJson(JournalEntry instance) =>
    <String, dynamic>{
      'entryId': instance.entryId,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'heartRate': instance.heartRate,
      'symptoms': instance.symptoms,
    };
