import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vbindex/data/data_source/remote/sample/sample_remote_data_source.dart';
import 'package:vbindex/data/mappers/sample/sample_item_mapper.dart';
import 'package:vbindex/data/models/request/sample/get_sample_items_request.dart';
import 'package:vbindex/data/services/auth_session_service.dart';
import 'package:vbindex/domain/entities/sample/sample_item_entities.dart';
import 'package:vbindex/domain/failures/failure.dart';
import 'package:vbindex/domain/repositories/sample/sample_repo.dart';

final class SampleRepoImpl implements SampleRepo {
  const SampleRepoImpl({
    required SampleRemoteDataSource remoteDataSource,
    required AuthSessionService sessionService,
  }) : _remoteDataSource = remoteDataSource,
       _sessionService = sessionService;

  final SampleRemoteDataSource _remoteDataSource;
  final AuthSessionService _sessionService;

  @override
  Future<Either<Failure, List<SampleItemEntities>>> getAll({
    String? keyword,
  }) async {
    try {
      final models = await _remoteDataSource.getItems(
        GetSampleItemsRequest(keyword: _blankToNull(keyword)),
      );
      return Right(SampleItemMapper.fromRemotes(models));
    } on DioException catch (e) {
      return Left(_failureFromDio(e, fallback: 'Không tải được danh sách'));
    } catch (e) {
      return Left(ServerFailure(mess: 'Get sample items failed: $e'));
    }
  }

  @override
  Future<Either<Failure, SampleItemEntities>> getById(int id) async {
    try {
      final model = await _remoteDataSource.getById(id);
      return Right(SampleItemMapper.fromRemote(model));
    } on DioException catch (e) {
      return Left(_failureFromDio(e, fallback: 'Không tải được chi tiết'));
    } catch (e) {
      return Left(ServerFailure(mess: 'Get sample item failed: $e'));
    }
  }

  @override
  Future<Either<Failure, SampleItemEntities>> create(
    SampleItemEntities item,
  ) async {
    try {
      if (!await _sessionService.hasValidSession()) {
        return const Left(ServerFailure(mess: 'Vui lòng đăng nhập'));
      }
      final created = await _remoteDataSource.create(
        SampleItemMapper.toUpsertRequest(item),
      );
      return Right(SampleItemMapper.fromRemote(created));
    } on DioException catch (e) {
      return Left(_failureFromDio(e, fallback: 'Không tạo được sample'));
    } catch (e) {
      return Left(ServerFailure(mess: 'Create sample item failed: $e'));
    }
  }

  @override
  Future<Either<Failure, SampleItemEntities>> update(
    SampleItemEntities item,
  ) async {
    try {
      final id = item.id;
      if (id == null) {
        return const Left(ServerFailure(mess: 'Thiếu id sample'));
      }
      if (!await _sessionService.hasValidSession()) {
        return const Left(ServerFailure(mess: 'Vui lòng đăng nhập'));
      }
      final updated = await _remoteDataSource.update(
        id,
        SampleItemMapper.toUpsertRequest(item),
      );
      return Right(SampleItemMapper.fromRemote(updated));
    } on DioException catch (e) {
      return Left(_failureFromDio(e, fallback: 'Không cập nhật được sample'));
    } catch (e) {
      return Left(ServerFailure(mess: 'Update sample item failed: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    try {
      if (!await _sessionService.hasValidSession()) {
        return const Left(ServerFailure(mess: 'Vui lòng đăng nhập'));
      }
      await _remoteDataSource.delete(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(_failureFromDio(e, fallback: 'Không xóa được sample'));
    } catch (e) {
      return Left(ServerFailure(mess: 'Delete sample item failed: $e'));
    }
  }

  String? _blankToNull(String? value) {
    final text = value?.trim();
    if (text == null || text.isEmpty) return null;
    return text;
  }

  Failure _failureFromDio(DioException e, {required String fallback}) {
    if (e.response == null) {
      return const NoConnectionFailure(mess: 'Không có kết nối mạng');
    }
    final statusCode = e.response?.statusCode;
    final data = e.response?.data;
    final message = data is Map && data['message'] is String
        ? data['message'] as String
        : null;
    if (message != null) {
      return ServerFailure(mess: message, statusCode: statusCode);
    }
    return ServerFailure(mess: e.message ?? fallback, statusCode: statusCode);
  }
}
