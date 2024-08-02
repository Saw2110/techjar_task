import 'package:flutter/material.dart';
import 'package:techjar_task/core/core.dart';

class Alert {
  static void show(
    BuildContext context, {
    required Widget child,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return _CustomAlertWidget(child);
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}

class _CustomAlertWidget extends StatelessWidget {
  final Widget child;
  const _CustomAlertWidget(this.child);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.screenHeight * .8,
        width: context.screenWidth * .5,
        child: Card(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
