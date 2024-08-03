import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techjar_task/core/core.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final String? title;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final int maxLines;
  const AppTextFormField({
    super.key,
    this.hintText,
    this.title,
    this.inputFormatters,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.focusNode,
    this.textEditingController,
    this.maxLines = 1,
  });

  TextFormField _textField() {
    return TextFormField(
      focusNode: focusNode,
      controller: textEditingController,
      initialValue: initialValue,
      readOnly: readOnly,
      onTap: onTap,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? IconButton(onPressed: null, icon: prefixIcon!)
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: null, icon: suffixIcon!)
            : null,
        fillColor: AppColors.midGrey.withOpacity(.1),
        filled: true,
        counter: const Offstage(),
        isDense: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return title == null
        ? _textField()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title!, style: context.kSubTitleText),
              5.xGap,
              _textField(),
            ],
          );
  }
}
