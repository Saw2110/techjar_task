import 'package:flutter/material.dart';

import '../core.dart';

class BottomSheetWrapper extends StatelessWidget {
  final EdgeInsets? padding;
  final double? topPadding;
  final Widget child;
  final bool showTopDivider;
  final int widgetSpacing;
  final String? title;

  const BottomSheetWrapper({
    super.key,
    this.padding,
    this.topPadding,
    this.showTopDivider = true,
    this.widgetSpacing = 24,
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        top: 10.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        color: AppColors.scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) Text(title!, style: context.kBoldSubTitleText),
          if (showTopDivider) ...[
            10.xGap,
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.midGrey,
              ),
            ),
          ],
          widgetSpacing.xGap,
          child,
        ],
      ),
    );
  }
}
