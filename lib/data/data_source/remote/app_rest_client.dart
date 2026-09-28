import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vbindex/data/data_source/remote/api_endpoints.dart';
import 'package:vbindex/data/models/request/sample/get_sample_items_request.dart';
import 'package:vbindex/data/models/request/sample/upsert_sample_item_request.dart';
import 'package:vbindex/data/models/response/base_response.dart';
import 'package:vbindex/data/models/response/sample/sample_item_remote_model.dart';

part 'app_rest_client.g.dart';

@RestApi()
abstract class AppRestClient {
  factory AppRestClient(Dio dio, {String? baseUrl}) = _AppRestClient;

  @GET(ApiEndpoints.sampleItems)
  Future<BaseResponse<List<SampleItemRemoteModel>>> getSampleItems(
    @Queries() GetSampleItemsRequest request,
  );

  @GET('${ApiEndpoints.sampleItems}/{id}')
  Future<BaseResponse<SampleItemRemoteModel>> getSampleItemById(
    @Path('id') int id,
  );

  @POST(ApiEndpoints.sampleItems)
  Future<BaseResponse<SampleItemRemoteModel>> createSampleItem(
    @Body() UpsertSampleItemRequest request,
  );

  @PATCH('${ApiEndpoints.sampleItems}/{id}')
  Future<BaseResponse<SampleItemRemoteModel>> updateSampleItem(
    @Path('id') int id,
    @Body() UpsertSampleItemRequest request,
  );

  @DELETE('${ApiEndpoints.sampleItems}/{id}')
  Future<BaseResponse<dynamic>> deleteSampleItem(@Path('id') int id);
}
