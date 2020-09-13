import 'package:json_annotation/json_annotation.dart';

part 'journal_entry.g.dart';

@JsonSerializable()
class JournalEntry {
  final String entryId;
  final String userId;
  final DateTime createdAt;
  final int heartRate;
  final List<Map<String, int>> symptoms;
  JournalEntry({
    this.entryId,
    this.userId,
    this.createdAt,
    this.heartRate,
    this.symptoms,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);
  Map<String, dynamic> toJson() => _$JournalEntryToJson(this);
}
