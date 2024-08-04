import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/core/core.dart';
import 'package:techjar_task/src/bottom_navbar/bottom_navbar_provider.dart';

class AlbumSection extends StatelessWidget {
  const AlbumSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = context.watch<BottomNavBarProvider>();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: bottomNavBarProvider.albumList.length,
      itemBuilder: (BuildContext context, int index) {
        var albumInfo = bottomNavBarProvider.albumList[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                albumInfo.title,
                style: context.kBoldSubTitleText,
                textAlign: TextAlign.center,
              ),
            ).paddingAll(20.0),
          ),
        );
      },
    );
  }
}
