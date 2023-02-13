import 'package:flutter_image_app/app/data/data.dart';
import 'package:flutter_image_app/core/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<BaseClient>(BaseClient());
    Get.put<PhotoService>(PhotoService(Get.find<BaseClient>()));
    await Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    }).then((value) {
      Get.put<SprefHelper>(SprefHelper(value));
    });
  }
}
