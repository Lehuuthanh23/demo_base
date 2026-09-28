import 'package:vbindex/data/models/request/sample/upsert_sample_item_request.dart';
import 'package:vbindex/data/models/response/sample/sample_item_remote_model.dart';
import 'package:vbindex/domain/entities/sample/sample_item_entities.dart';

final class SampleItemMapper {
  const SampleItemMapper._();

  static SampleItemEntities fromRemote(SampleItemRemoteModel model) {
    return SampleItemEntities(
      id: model.id,
      title: model.title,
      note: model.note,
      amount: model.amount,
      occurredAt: model.occurredAt,
      createdAt: model.createdAt,
    );
  }

  static List<SampleItemEntities> fromRemotes(
    List<SampleItemRemoteModel> models,
  ) => models.map(fromRemote).toList();

  static UpsertSampleItemRequest toUpsertRequest(SampleItemEntities entity) {
    return UpsertSampleItemRequest(
      title: entity.title,
      note: entity.note,
      amount: entity.amount,
      occurredAt: entity.occurredAt,
    );
  }
}
