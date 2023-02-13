// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_image_app/app/data/data.dart';
import 'package:flutter_image_app/core/core.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with BaseController {
  final _photoService = Get.find<PhotoService>();

  var listPhotos = <PhotoReponse>[].obs;
  var page = 1;
  var loading = true;
  var canLoadMore = true.obs;

  final double endReachThreshold = 200;
  final ScrollController scrollController = ScrollController();

  void _onScroll() async {
    if (!scrollController.hasClients || loading) return;
    print(
      "current ${scrollController.offset}  max: ${scrollController.position.maxScrollExtent}",
    );

    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange &&
        canLoadMore.value) {
      onLoadMore();
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onReady() async {
    await getListPhotos();
    super.onReady();
  }

  Future<void> getListPhotos() async {
    loading = true;
    showLoading();
    await _photoService.getListPhotos(page: page).then((response) {
      loading = false;
      hideLoading();
      if (response.isNotEmpty) {
        listPhotos.clear();
        listPhotos.value = response;
        listPhotos.refresh();
      }
    }).catchError((e) {
      loading = false;
      hideLoading();
      handleErrorWithSnackbar(e);
    });
  }

  Future<void> onPullToRefresh() async {
    page = 1;
    canLoadMore.value = true;
    loading = true;
    await _photoService.getListPhotos(page: page).then((response) {
      loading = false;
      if (response.isNotEmpty) {
        listPhotos.clear();
        listPhotos.value = response;
        listPhotos.refresh();
      }
    }).catchError((e) {
      loading = false;
      handleErrorWithSnackbar(e);
    });
  }

  Future<void> onLoadMore() async {
    if (page == 5) {
      canLoadMore.value = false;
      loading = false;
      return;
    }
    loading = true;
    page += 1;
    await _photoService.getListPhotos(page: page).then((response) {
      loading = false;
      if (response.isNotEmpty) {
        listPhotos.addAll(response);
        listPhotos.refresh();
      } else {
        canLoadMore.value = false;
      }
    }).catchError((e) {
      loading = false;
      canLoadMore.value = false;
      handleErrorWithSnackbar(e);
    });
  }
}
