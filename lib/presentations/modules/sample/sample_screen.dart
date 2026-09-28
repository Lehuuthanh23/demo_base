import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbindex/presentations/models/sample_item_model.dart';
import 'package:vbindex/presentations/modules/sample/components/sample_view.dart';
import 'package:vbindex/presentations/modules/sample/components/upsert_sample_sheet.dart';
import 'package:vbindex/presentations/modules/sample/cubit/sample_cubit.dart';
import 'package:vbindex/widgets/custom_dialog.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SampleCubit(),
      child: BlocBuilder<SampleCubit, SampleState>(
        builder: (context, state) {
          final cubit = context.read<SampleCubit>();
          return SampleView(
            state: state,
            onSearchChanged: cubit.updateSearch,
            onSearch: (value) => cubit.updateSearch(value, immediate: true),
            onRefresh: cubit.refresh,
            onAdd: () => _openEditor(context, cubit),
            onEdit: (item) => _openEditor(context, cubit, item: item),
            onDelete: (item) => _confirmDelete(context, cubit, item),
          );
        },
      ),
    );
  }

  Future<void> _openEditor(
    BuildContext context,
    SampleCubit cubit, {
    SampleItemModel? item,
  }) async {
    SampleItemModel? current = item;
    final id = item?.id;
    if (id != null) {
      current = await cubit.fetchById(id);
      if (!context.mounted || current == null) return;
    }
    if (!context.mounted) return;
    await showUpsertSampleSheet(context, cubit: cubit, item: current);
  }

  Future<void> _confirmDelete(
    BuildContext context,
    SampleCubit cubit,
    SampleItemModel item,
  ) async {
    final id = item.id;
    if (id == null) return;
    final accepted = await showCustomDialog(
      context: context,
      title: 'Xóa sample',
      content: 'Xóa "${item.title}"?',
      acceptLabel: 'Xóa',
      destructiveAccept: true,
    );
    if (accepted == true) await cubit.delete(id);
  }
}
