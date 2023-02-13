import 'package:flutter_image_app/app/modules/modules.dart';
import 'package:get/get.dart';

part './routes.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PHOTO_VIEW,
      page: () => const PhotoViewPage(),
      binding: PhotoViewBinding(),
    ),
  ];
}
