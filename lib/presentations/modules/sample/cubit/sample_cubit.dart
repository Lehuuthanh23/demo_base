import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:vbindex/domain/entities/sample/sample_item_entities.dart';
import 'package:vbindex/domain/usecases/sample/sample_usecases.dart';
import 'package:vbindex/presentations/mappers/sample_presentation_mapper.dart';
import 'package:vbindex/presentations/models/sample_item_model.dart';
import 'package:vbindex/widgets/custom_toast.dart';

part 'sample_state.dart';

final class SampleCubit extends Cubit<SampleState> {
  SampleCubit()
    : _getSampleItemsUsecase = getIt.get<GetSampleItemsUsecase>(),
      _getSampleItemByIdUsecase = getIt.get<GetSampleItemByIdUsecase>(),
      _createSampleItemUsecase = getIt.get<CreateSampleItemUsecase>(),
      _updateSampleItemUsecase = getIt.get<UpdateSampleItemUsecase>(),
      _deleteSampleItemUsecase = getIt.get<DeleteSampleItemUsecase>(),
      super(const SampleState()) {
    unawaited(_loadInitialData());
  }

  final GetSampleItemsUsecase _getSampleItemsUsecase;
  final GetSampleItemByIdUsecase _getSampleItemByIdUsecase;
  final CreateSampleItemUsecase _createSampleItemUsecase;
  final UpdateSampleItemUsecase _updateSampleItemUsecase;
  final DeleteSampleItemUsecase _deleteSampleItemUsecase;

  Timer? _searchDebounce;
  int _requestId = 0;

  Future<void> _loadInitialData() async {
    emit(state.copyWith(status: SampleStatus.loading, clearError: true));
    await _fetchItems();
  }

  void updateSearch(String value, {bool immediate = false}) {
    emit(state.copyWith(searchQuery: value, clearError: true));
    _searchDebounce?.cancel();
    if (immediate) {
      unawaited(_refreshItems(clearItems: true));
      return;
    }
    _searchDebounce = Timer(
      const Duration(milliseconds: 500),
      () => unawaited(_refreshItems(clearItems: true)),
    );
  }

  Future<void> refresh() => _refreshItems();

  Future<SampleItemModel?> fetchById(int id) async {
    final result = await _getSampleItemByIdUsecase(id);
    return result.fold((failure) {
      CustomToast.error(failure.mess);
      return null;
    }, SamplePresentationMapper.toModel);
  }

  Future<bool> save({
    int? id,
    required String title,
    String? note,
    required double amount,
    required DateTime occurredAt,
  }) async {
    final trimmedNote = note?.trim();
    final entity = SampleItemEntities(
      id: id,
      title: title.trim(),
      note: trimmedNote == null || trimmedNote.isEmpty ? null : trimmedNote,
      amount: amount,
      occurredAt: occurredAt,
    );
    final result = id == null
        ? await _createSampleItemUsecase(entity)
        : await _updateSampleItemUsecase(entity);
    if (isClosed) return false;

    var ok = false;
    result.fold((failure) => CustomToast.error(failure.mess), (_) => ok = true);
    if (ok) await _refreshItems();
    return ok;
  }

  Future<bool> delete(int id) async {
    final result = await _deleteSampleItemUsecase(id);
    if (isClosed) return false;

    var ok = false;
    result.fold((failure) => CustomToast.error(failure.mess), (_) => ok = true);
    if (ok) await _refreshItems();
    return ok;
  }

  Future<void> _refreshItems({bool clearItems = false}) async {
    emit(
      state.copyWith(
        status: SampleStatus.loading,
        clearError: true,
        items: clearItems ? const [] : null,
      ),
    );
    await _fetchItems();
  }

  Future<void> _fetchItems() async {
    final requestId = ++_requestId;
    final keyword = state.searchQuery.trim();
    final result = await _getSampleItemsUsecase(
      keyword: keyword.isEmpty ? null : keyword,
    );
    if (isClosed || requestId != _requestId) return;

    result.fold(
      (failure) {
        if (state.items.isEmpty) {
          emit(
            state.copyWith(
              status: SampleStatus.failure,
              error: failure.mess,
            ),
          );
          return;
        }
        emit(state.copyWith(status: SampleStatus.success));
        CustomToast.error(failure.mess);
      },
      (entities) {
        emit(
          state.copyWith(
            status: SampleStatus.success,
            clearError: true,
            items: entities.map(SamplePresentationMapper.toModel).toList(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
