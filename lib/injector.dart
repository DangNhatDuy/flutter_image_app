import 'package:flutter_image_app/app/data/data.dart';
import 'package:flutter_image_app/core/core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings {
  InitialBinding._();

  static final InitialBinding instance = InitialBinding._();

  @override
  void dependencies() {
    Get.put<BaseClient>(BaseClient());
    Get.put<PhotoService>(PhotoService(Get.find<BaseClient>()));
  }

  Future<void> initData() async {
    await Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    }).then((value) {
      Get.put<SprefHelper>(SprefHelper(value));
    });
  }
}
