import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/presentations/models/sample_item_model.dart';
import 'package:vbindex/presentations/modules/sample/cubit/sample_cubit.dart';
import 'package:vbindex/utils/number_formatter.dart';
import 'package:vbindex/widgets/app_bottom_sheet.dart';
import 'package:vbindex/widgets/app_text_form_field.dart';
import 'package:vbindex/widgets/custom_button.dart';

Future<void> showUpsertSampleSheet(
  BuildContext context, {
  required SampleCubit cubit,
  SampleItemModel? item,
}) {
  return AppBottomSheet.show<void>(
    context: context,
    child: _UpsertSampleSheet(cubit: cubit, item: item),
  );
}

class _UpsertSampleSheet extends StatefulWidget {
  const _UpsertSampleSheet({required this.cubit, this.item});

  final SampleCubit cubit;
  final SampleItemModel? item;

  @override
  State<_UpsertSampleSheet> createState() => _UpsertSampleSheetState();
}

class _UpsertSampleSheetState extends State<_UpsertSampleSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteController;
  late final TextEditingController _amountController;
  late final TextEditingController _dateController;
  late DateTime _occurredAt;
  var _saving = false;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _titleController = TextEditingController(text: item?.title ?? '');
    _noteController = TextEditingController(text: item?.note ?? '');
    _amountController = TextEditingController(
      text: item == null ? '' : NumberFormatter.decimal(item.amount),
    );
    _occurredAt = item?.occurredAt ?? DateTime.now();
    _dateController = TextEditingController(text: _formatDate(_occurredAt));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    return '$day/$month/${value.year}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _occurredAt,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      _occurredAt = picked;
      _dateController.text = _formatDate(picked);
    });
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final amount = NumberFormatter.parse(_amountController.text);
    if (title.isEmpty || amount <= 0) return;
    setState(() => _saving = true);
    final ok = await widget.cubit.save(
      id: widget.item?.id,
      title: title,
      note: _noteController.text,
      amount: amount,
      occurredAt: _occurredAt,
    );
    if (!mounted) return;
    if (ok) {
      Navigator.of(context).pop();
      return;
    }
    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetScaffold(
      title: widget.item == null ? 'Tạo sample' : 'Sửa sample',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextFormField(
            controller: _titleController,
            label: 'Tiêu đề',
            hintText: 'Nhập tiêu đề',
          ),
          SizedBox(height: AppSpacing.spacing3.h),
          AppTextFormField(
            controller: _noteController,
            label: 'Ghi chú',
            hintText: 'Không bắt buộc',
            maxLines: 3,
          ),
          SizedBox(height: AppSpacing.spacing3.h),
          AppTextFormField(
            controller: _amountController,
            label: 'Số tiền',
            hintText: '0',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
            ],
          ),
          SizedBox(height: AppSpacing.spacing3.h),
          AppTextFormField(
            controller: _dateController,
            label: 'Ngày',
            readOnly: true,
            onTap: _pickDate,
          ),
          SizedBox(height: AppSpacing.spacing4.h),
          CustomButton(
            label: _saving
                ? 'Đang lưu'
                : widget.item == null
                ? 'Tạo'
                : 'Cập nhật',
            onPressed: _saving ? null : _submit,
          ),
        ],
      ),
    );
  }
}
