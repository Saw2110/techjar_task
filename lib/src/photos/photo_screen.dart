import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techjar_task/core/core.dart';
import 'package:techjar_task/src/photos/photos_provider.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PhotosProvider>().context = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PhotosProvider>();
    return PageWrapper(
      body: Visibility(
        visible: provider.isLoading,
        replacement: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: provider.photoList.length,
          itemBuilder: (BuildContext context, int index) {
            var photoInfo = provider.photoList[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(photoInfo.thumbnailUrl),
            );
          },
        ),
        child: const LoadingWidget(),
      ),
    );
  }
}
