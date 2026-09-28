import 'package:core/core.dart';
import 'package:vbindex/data/data_source/remote/app_rest_client.dart';
import 'package:vbindex/data/models/request/sample/get_sample_items_request.dart';
import 'package:vbindex/data/models/request/sample/upsert_sample_item_request.dart';
import 'package:vbindex/data/models/response/base_response.dart';
import 'package:vbindex/data/models/response/sample/sample_item_remote_model.dart';

/// Central REST service — thêm method gọi API mới tại đây và trong [AppRestClient].
final class AppRestService extends BaseRestService<AppRestClient> {
  AppRestService(super.dio, {super.baseUrl})
    : super(createClient: AppRestClient.new);

  AppRestClient get _client => restClient;

  Future<BaseResponse<List<SampleItemRemoteModel>>> getSampleItems(
    GetSampleItemsRequest request,
  ) => _client.getSampleItems(request);

  Future<BaseResponse<SampleItemRemoteModel>> getSampleItemById(int id) =>
      _client.getSampleItemById(id);

  Future<BaseResponse<SampleItemRemoteModel>> createSampleItem(
    UpsertSampleItemRequest request,
  ) => _client.createSampleItem(request);

  Future<BaseResponse<SampleItemRemoteModel>> updateSampleItem(
    int id,
    UpsertSampleItemRequest request,
  ) => _client.updateSampleItem(id, request);

  Future<BaseResponse<dynamic>> deleteSampleItem(int id) =>
      _client.deleteSampleItem(id);
}
