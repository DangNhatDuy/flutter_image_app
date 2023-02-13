import 'package:flutter_image_app/app/modules/photo_view/photo_view_controller.dart';
import 'package:get/get.dart';

class PhotoViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoViewPageController>(() => PhotoViewPageController());
  }
}
