import 'package:json_annotation/json_annotation.dart';

class JsonDoubleConverter implements JsonConverter<double?, dynamic> {
  const JsonDoubleConverter();

  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    return double.tryParse(json.toString());
  }

  @override
  dynamic toJson(double? object) => object;
}

class JsonRequiredDoubleConverter implements JsonConverter<double, dynamic> {
  const JsonRequiredDoubleConverter();

  @override
  double fromJson(dynamic json) =>
      const JsonDoubleConverter().fromJson(json) ?? 0;

  @override
  dynamic toJson(double object) => object;
}

class JsonIntConverter implements JsonConverter<int?, dynamic> {
  const JsonIntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json;
    if (json is num) return json.toInt();
    return int.tryParse(json.toString());
  }

  @override
  dynamic toJson(int? object) => object;
}

class JsonRequiredIntConverter implements JsonConverter<int, dynamic> {
  const JsonRequiredIntConverter();

  @override
  int fromJson(dynamic json) => const JsonIntConverter().fromJson(json) ?? 0;

  @override
  dynamic toJson(int object) => object;
}

class JsonBoolConverter implements JsonConverter<bool, dynamic> {
  const JsonBoolConverter();

  @override
  bool fromJson(dynamic json) {
    if (json is bool) return json;
    if (json is num) return json != 0;
    final text = json?.toString().toLowerCase();
    return text == 'true' || text == '1';
  }

  @override
  dynamic toJson(bool object) => object;
}

class JsonDateTimeConverter implements JsonConverter<DateTime?, dynamic> {
  const JsonDateTimeConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is DateTime) return json;
    if (json is num) {
      final ms = json < 1e12 ? (json * 1000).toInt() : json.toInt();
      return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    }
    final text = json.toString().trim();
    if (text.isEmpty) return null;
    final asNum = num.tryParse(text);
    if (asNum != null) {
      final ms = asNum < 1e12 ? (asNum * 1000).toInt() : asNum.toInt();
      return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    }
    return DateTime.tryParse(text)?.toLocal();
  }

  @override
  dynamic toJson(DateTime? object) => object?.toUtc().toIso8601String();
}

class JsonRequiredDateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const JsonRequiredDateTimeConverter();

  @override
  DateTime fromJson(dynamic json) =>
      const JsonDateTimeConverter().fromJson(json) ?? DateTime.now();

  @override
  dynamic toJson(DateTime object) => object.toUtc().toIso8601String();
}
