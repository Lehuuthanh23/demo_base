import 'package:equatable/equatable.dart';

final class SampleItemEntities extends Equatable {
  const SampleItemEntities({
    this.id,
    required this.title,
    this.note,
    required this.amount,
    required this.occurredAt,
    this.createdAt,
  });

  final int? id;
  final String title;
  final String? note;
  final double amount;
  final DateTime occurredAt;
  final DateTime? createdAt;

  SampleItemEntities copyWith({
    int? id,
    String? title,
    String? note,
    double? amount,
    DateTime? occurredAt,
    DateTime? createdAt,
  }) {
    return SampleItemEntities(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      amount: amount ?? this.amount,
      occurredAt: occurredAt ?? this.occurredAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, note, amount, occurredAt, createdAt];
}
