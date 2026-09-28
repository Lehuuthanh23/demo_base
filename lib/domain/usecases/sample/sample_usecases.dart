import 'package:dartz/dartz.dart';
import 'package:vbindex/domain/entities/sample/sample_item_entities.dart';
import 'package:vbindex/domain/failures/failure.dart';
import 'package:vbindex/domain/repositories/sample/sample_repo.dart';

final class GetSampleItemsUsecase {
  const GetSampleItemsUsecase(this._repo);

  final SampleRepo _repo;

  Future<Either<Failure, List<SampleItemEntities>>> call({String? keyword}) =>
      _repo.getAll(keyword: keyword);
}

final class GetSampleItemByIdUsecase {
  const GetSampleItemByIdUsecase(this._repo);

  final SampleRepo _repo;

  Future<Either<Failure, SampleItemEntities>> call(int id) => _repo.getById(id);
}

final class CreateSampleItemUsecase {
  const CreateSampleItemUsecase(this._repo);

  final SampleRepo _repo;

  Future<Either<Failure, SampleItemEntities>> call(SampleItemEntities item) =>
      _repo.create(item);
}

final class UpdateSampleItemUsecase {
  const UpdateSampleItemUsecase(this._repo);

  final SampleRepo _repo;

  Future<Either<Failure, SampleItemEntities>> call(SampleItemEntities item) =>
      _repo.update(item);
}

final class DeleteSampleItemUsecase {
  const DeleteSampleItemUsecase(this._repo);

  final SampleRepo _repo;

  Future<Either<Failure, Unit>> call(int id) => _repo.delete(id);
}
