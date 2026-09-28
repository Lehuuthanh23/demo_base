import 'package:json_annotation/json_annotation.dart';
import 'package:vbindex/data/models/json_converters.dart';

part 'upsert_sample_item_request.g.dart';

/// Body `POST/PATCH /api/v1/sample-items`
@JsonSerializable(includeIfNull: false)
final class UpsertSampleItemRequest {
  const UpsertSampleItemRequest({
    required this.title,
    this.note,
    required this.amount,
    required this.occurredAt,
  });

  final String title;
  final String? note;

  @JsonRequiredDoubleConverter()
  final double amount;

  @JsonKey(name: 'occurred_at')
  @JsonRequiredDateTimeConverter()
  final DateTime occurredAt;

  factory UpsertSampleItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpsertSampleItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpsertSampleItemRequestToJson(this);
}
