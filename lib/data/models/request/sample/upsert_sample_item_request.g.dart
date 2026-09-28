// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_sample_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertSampleItemRequest _$UpsertSampleItemRequestFromJson(
  Map<String, dynamic> json,
) => UpsertSampleItemRequest(
  title: json['title'] as String,
  note: json['note'] as String?,
  amount: const JsonRequiredDoubleConverter().fromJson(json['amount']),
  occurredAt: const JsonRequiredDateTimeConverter().fromJson(
    json['occurred_at'],
  ),
);

Map<String, dynamic> _$UpsertSampleItemRequestToJson(
  UpsertSampleItemRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'note': ?instance.note,
  'amount': ?const JsonRequiredDoubleConverter().toJson(instance.amount),
  'occurred_at': ?const JsonRequiredDateTimeConverter().toJson(
    instance.occurredAt,
  ),
};
