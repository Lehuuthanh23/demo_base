import 'package:dartz/dartz.dart';
import 'package:vbindex/domain/entities/sample/sample_item_entities.dart';
import 'package:vbindex/domain/failures/failure.dart';

abstract interface class SampleRepo {
  Future<Either<Failure, List<SampleItemEntities>>> getAll({String? keyword});

  Future<Either<Failure, SampleItemEntities>> getById(int id);

  Future<Either<Failure, SampleItemEntities>> create(SampleItemEntities item);

  Future<Either<Failure, SampleItemEntities>> update(SampleItemEntities item);

  Future<Either<Failure, Unit>> delete(int id);
}
