import 'package:vbindex/data/data_source/remote/app_rest_service.dart';
import 'package:vbindex/data/models/request/sample/get_sample_items_request.dart';
import 'package:vbindex/data/models/request/sample/upsert_sample_item_request.dart';
import 'package:vbindex/data/models/response/sample/sample_item_remote_model.dart';

abstract interface class SampleRemoteDataSource {
  Future<List<SampleItemRemoteModel>> getItems(GetSampleItemsRequest request);

  Future<SampleItemRemoteModel> getById(int id);

  Future<SampleItemRemoteModel> create(UpsertSampleItemRequest request);

  Future<SampleItemRemoteModel> update(int id, UpsertSampleItemRequest request);

  Future<void> delete(int id);
}

final class SampleRemoteDataSourceImpl implements SampleRemoteDataSource {
  const SampleRemoteDataSourceImpl({required AppRestService appRestService})
    : _appRestService = appRestService;

  final AppRestService _appRestService;

  @override
  Future<List<SampleItemRemoteModel>> getItems(
    GetSampleItemsRequest request,
  ) async {
    // final response = await _appRestService.getSampleItems(request);
    // return response.data ?? const [];
    return [
      SampleItemRemoteModel(
        id: 1,
        title: 'Sample 1',
        amount: 100,
        occurredAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
      SampleItemRemoteModel(
        id: 2,
        title: 'Sample 2',
        amount: 200,
        occurredAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
      SampleItemRemoteModel(
        id: 3,
        title: 'Sample 3',
        amount: 300,
        occurredAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
    ];
  }

  @override
  Future<SampleItemRemoteModel> getById(int id) async {
    final response = await _appRestService.getSampleItemById(id);
    return _requireData(response.success, response.message, response.data);
  }

  @override
  Future<SampleItemRemoteModel> create(UpsertSampleItemRequest request) async {
    final response = await _appRestService.createSampleItem(request);
    return _requireData(response.success, response.message, response.data);
  }

  @override
  Future<SampleItemRemoteModel> update(
    int id,
    UpsertSampleItemRequest request,
  ) async {
    final response = await _appRestService.updateSampleItem(id, request);
    return _requireData(response.success, response.message, response.data);
  }

  @override
  Future<void> delete(int id) async {
    final response = await _appRestService.deleteSampleItem(id);
    if (response.success == false) {
      throw StateError(response.message ?? 'Xóa sample thất bại');
    }
  }

  SampleItemRemoteModel _requireData(
    bool? success,
    String? message,
    SampleItemRemoteModel? data,
  ) {
    if (success == false || data == null) {
      throw StateError(message ?? 'Yêu cầu sample thất bại');
    }
    return data;
  }
}
