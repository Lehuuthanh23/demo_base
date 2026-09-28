import 'package:json_annotation/json_annotation.dart';
import 'package:vbindex/data/models/json_converters.dart';

part 'sample_item_remote_model.g.dart';

/// Remote row for `sample-items` (snake_case JSON from API).
@JsonSerializable()
final class SampleItemRemoteModel {
  const SampleItemRemoteModel({
    this.id,
    required this.title,
    this.note,
    required this.amount,
    required this.occurredAt,
    required this.createdAt,
  });

  @JsonIntConverter()
  final int? id;

  final String title;
  final String? note;

  @JsonRequiredDoubleConverter()
  final double amount;

  @JsonKey(name: 'occurred_at')
  @JsonRequiredDateTimeConverter()
  final DateTime occurredAt;

  @JsonKey(name: 'created_at')
  @JsonRequiredDateTimeConverter()
  final DateTime createdAt;

  factory SampleItemRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$SampleItemRemoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleItemRemoteModelToJson(this);
}
