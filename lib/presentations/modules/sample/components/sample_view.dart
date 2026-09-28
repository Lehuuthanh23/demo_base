import 'package:core/core.dart' show AppLocalizations;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_radius.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';
import 'package:vbindex/presentations/models/sample_item_model.dart';
import 'package:vbindex/presentations/modules/sample/cubit/sample_cubit.dart';
import 'package:vbindex/widgets/app_text_form_field.dart';
import 'package:vbindex/widgets/base_page.dart';
import 'package:vbindex/widgets/base_widget.dart';
import 'package:vbindex/widgets/empty_widget.dart';

class SampleView extends BaseWidget {
  const SampleView({
    super.key,
    required this.state,
    required this.onSearchChanged,
    required this.onSearch,
    required this.onRefresh,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
  });

  final SampleState state;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSearch;
  final Future<void> Function() onRefresh;
  final VoidCallback onAdd;
  final ValueChanged<SampleItemModel> onEdit;
  final ValueChanged<SampleItemModel> onDelete;

  @override
  Widget build(BuildContext context, AppLocalizations tr) {
    return BasePage(
      title: 'Sample',
      onRefresh: onRefresh,
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        backgroundColor: AppColor.goldGradient.colors.first,
        child: const Icon(Icons.add, color: AppColor.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.spacing4.w,
              AppSpacing.spacing3.h,
              AppSpacing.spacing4.w,
              AppSpacing.spacing2.h,
            ),
            child: _SampleSearchField(
              onChanged: onSearchChanged,
              onSearch: onSearch,
            ),
          ),
          _body(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    if (state.status == SampleStatus.loading && state.items.isEmpty) {
      return const _SampleStatusSlot(child: CircularProgressIndicator());
    }
    if (state.status == SampleStatus.failure && state.items.isEmpty) {
      return _SampleStatusSlot(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.spacing4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyTextSM.copyWith(
                  color: AppColor.textOnCard(context),
                ),
              ),
              SizedBox(height: AppSpacing.spacing3.h),
              TextButton(
                onPressed: () => onRefresh(),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      );
    }
    if (state.items.isEmpty) {
      return const _SampleStatusSlot(
        child: EmptyWidget(title: 'Chưa có sample'),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.spacing4.w,
        AppSpacing.spacing2.h,
        AppSpacing.spacing4.w,
        96.h,
      ),
      child: Column(
        children: [
          for (var index = 0; index < state.items.length; index++) ...[
            if (index > 0) SizedBox(height: AppSpacing.spacing2.h),
            _SampleItemCard(
              item: state.items[index],
              onTap: () => onEdit(state.items[index]),
              onDelete: () => onDelete(state.items[index]),
            ),
          ],
        ],
      ),
    );
  }
}

class _SampleStatusSlot extends StatelessWidget {
  const _SampleStatusSlot({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 360.h, child: Center(child: child));
  }
}

class _SampleSearchField extends StatefulWidget {
  const _SampleSearchField({required this.onChanged, required this.onSearch});

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSearch;

  @override
  State<_SampleSearchField> createState() => _SampleSearchFieldState();
}

class _SampleSearchFieldState extends State<_SampleSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: _controller,
      hintText: 'Tìm theo tiêu đề',
      textInputAction: TextInputAction.search,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        onPressed: () => widget.onSearch(_controller.text),
        icon: Icon(Icons.search, color: AppColor.pageTitle(context)),
      ),
    );
  }
}

class _SampleItemCard extends StatelessWidget {
  const _SampleItemCard({
    required this.item,
    required this.onTap,
    required this.onDelete,
  });

  final SampleItemModel item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final note = item.note;
    return Material(
      color: AppColor.cardBackground(context),
      borderRadius: BorderRadius.circular(AppRadius.xl.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.xl.r),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.spacing4.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTextStyle.bodyTextMDBold.copyWith(
                        color: AppColor.textOnCard(context),
                      ),
                    ),
                    if (note != null && note.isNotEmpty) ...[
                      SizedBox(height: AppSpacing.spacing1.h),
                      Text(
                        note,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.bodyTextSM.copyWith(
                          color: AppColor.textOnCard(context),
                        ),
                      ),
                    ],
                    SizedBox(height: AppSpacing.spacing2.h),
                    Text(
                      '${item.amountLabel} · ${item.occurredAtLabel}',
                      style: AppTextStyle.bodyTextXS.copyWith(
                        color: AppColor.textOnCard(context),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColor.pageTitle(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
