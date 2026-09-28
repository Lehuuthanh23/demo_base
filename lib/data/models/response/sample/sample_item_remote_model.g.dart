// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_item_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleItemRemoteModel _$SampleItemRemoteModelFromJson(
  Map<String, dynamic> json,
) => SampleItemRemoteModel(
  id: const JsonIntConverter().fromJson(json['id']),
  title: json['title'] as String,
  note: json['note'] as String?,
  amount: const JsonRequiredDoubleConverter().fromJson(json['amount']),
  occurredAt: const JsonRequiredDateTimeConverter().fromJson(
    json['occurred_at'],
  ),
  createdAt: const JsonRequiredDateTimeConverter().fromJson(json['created_at']),
);

Map<String, dynamic> _$SampleItemRemoteModelToJson(
  SampleItemRemoteModel instance,
) => <String, dynamic>{
  'id': const JsonIntConverter().toJson(instance.id),
  'title': instance.title,
  'note': instance.note,
  'amount': const JsonRequiredDoubleConverter().toJson(instance.amount),
  'occurred_at': const JsonRequiredDateTimeConverter().toJson(
    instance.occurredAt,
  ),
  'created_at': const JsonRequiredDateTimeConverter().toJson(
    instance.createdAt,
  ),
};
