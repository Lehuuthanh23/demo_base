import 'package:json_annotation/json_annotation.dart';

part 'get_sample_items_request.g.dart';

/// Query `GET /api/v1/sample-items?keyword=`
@JsonSerializable(includeIfNull: false)
final class GetSampleItemsRequest {
  const GetSampleItemsRequest({this.keyword});

  final String? keyword;

  factory GetSampleItemsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSampleItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSampleItemsRequestToJson(this);
}
