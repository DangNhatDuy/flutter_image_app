import 'package:flutter_image_app/app/data/data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _photoService = Get.find<PhotoService>();

  @override
  void onReady() async {
    var response = await _photoService.getListPhotos();
    print(response);
    super.onReady();
  }
}
