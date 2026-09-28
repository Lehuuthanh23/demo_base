part of 'sample_cubit.dart';

enum SampleStatus { initial, loading, success, failure }

final class SampleState extends Equatable {
  const SampleState({
    this.items = const [],
    this.status = SampleStatus.initial,
    this.error,
    this.searchQuery = '',
  });

  final List<SampleItemModel> items;
  final SampleStatus status;
  final String? error;
  final String searchQuery;

  bool get isLoading => status == SampleStatus.loading;

  SampleState copyWith({
    List<SampleItemModel>? items,
    SampleStatus? status,
    String? error,
    String? searchQuery,
    bool clearError = false,
  }) {
    return SampleState(
      items: items ?? this.items,
      status: status ?? this.status,
      error: clearError ? null : (error ?? this.error),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [items, status, error, searchQuery];
}
