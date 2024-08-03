import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';

class AppButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final Color? color;
  const AppButton({
    super.key,
    this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppColors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.kBoldSubTitleText.copyWith(
              color: AppColors.white,
            ),
          ).paddingSymmetric(20.0, 13.0),
        ),
      ),
    );
  }
}
