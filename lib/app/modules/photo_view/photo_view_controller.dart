import 'package:flutter/material.dart';
import 'package:flutter_image_app/core/core.dart';
import 'package:get/get.dart';

class PhotoViewPageController extends GetxController with BaseController {
  final SprefHelper _sprefHelper = Get.find<SprefHelper>();

  List<String> bookmarks = [];
  var isBookmark = false.obs;

  @override
  void onInit() {
    super.onInit();
    bookmarks = _sprefHelper.getBookmarks();
  }

  void checkIsBookmark(String photo) {
    if (photo.isEmpty) return;
    if (bookmarks.contains(photo)) {
      isBookmark.value = true;
    }
  }

  void onClick(String photo) {
    if (photo.isEmpty) return;
    if (bookmarks.contains(photo)) {
      bookmarks.remove(photo);
      UIHelper.showSnackbar(
        'Success',
        'Remove from bookmark successfully',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      bookmarks.add(photo);
      UIHelper.showSnackbar(
        'Success',
        'Add to bookmark successfully',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
      );
    }
    _sprefHelper.setBookmarks(bookmarks);
    isBookmark.value = !isBookmark.value;
  }
}
