import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_app/app/modules/photo_view/photo_view_controller.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({super.key});

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  final _photo = Get.arguments['photo'] as String;
  final _controller = Get.find<PhotoViewPageController>();

  @override
  void initState() {
    super.initState();
    _controller.checkIsBookmark(_photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.grey.shade400,
          ),
          imageProvider: CachedNetworkImageProvider(_photo),
          heroAttributes: PhotoViewHeroAttributes(tag: _photo),
          minScale: PhotoViewComputedScale.contained,
        ),
      ),
      floatingActionButton: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _controller.onClick(_photo);
        },
        child: Obx(
          () => Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: _controller.isBookmark.value ? Colors.red : Colors.green,
            ),
            child: Obx(
              () => Icon(_controller.isBookmark.value
                  ? Icons.bookmark_remove
                  : Icons.bookmark_added),
            ),
          ),
        ),
      ),
    );
  }
}
