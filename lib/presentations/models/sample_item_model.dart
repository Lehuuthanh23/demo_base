import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:vbindex/utils/number_formatter.dart';

final class SampleItemModel extends Equatable {
  const SampleItemModel({
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

  String get amountLabel => NumberFormatter.decimal(amount);

  String get occurredAtLabel => DateFormat('dd/MM/yyyy').format(occurredAt);

  @override
  List<Object?> get props => [id, title, note, amount, occurredAt, createdAt];
}
