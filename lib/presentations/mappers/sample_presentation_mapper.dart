import 'package:vbindex/domain/entities/sample/sample_item_entities.dart';
import 'package:vbindex/presentations/models/sample_item_model.dart';

final class SamplePresentationMapper {
  const SamplePresentationMapper._();

  static SampleItemModel toModel(SampleItemEntities entity) {
    return SampleItemModel(
      id: entity.id,
      title: entity.title,
      note: entity.note,
      amount: entity.amount,
      occurredAt: entity.occurredAt,
      createdAt: entity.createdAt,
    );
  }

  static SampleItemEntities toEntity(SampleItemModel model) {
    return SampleItemEntities(
      id: model.id,
      title: model.title,
      note: model.note,
      amount: model.amount,
      occurredAt: model.occurredAt,
      createdAt: model.createdAt,
    );
  }
}
