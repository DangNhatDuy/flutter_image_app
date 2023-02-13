import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_app/app/modules/bookmark/bookmark_page.dart';
import 'package:flutter_image_app/app/modules/home/home_controller.dart';
import 'package:flutter_image_app/routes/pages.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Obx(
            () => CustomScrollView(
              controller: _controller.scrollController,
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    _controller.onPullToRefresh();
                  },
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    ((context, index) {
                      var item = _controller.listPhotos[index];
                      return SizedBox(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.PHOTO_VIEW,
                              arguments: {
                                'photo': item.urls?.regular ?? '',
                              },
                            );
                          },
                          child: Hero(
                            tag: item.id ?? '',
                            child: CachedNetworkImage(
                              imageUrl: item.urls?.regular ?? '',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey,
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    childCount: _controller.listPhotos.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Obx(
                    () => _controller.canLoadMore.value
                        ? Container(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              strokeWidth: 3.0,
                            ),
                          )
                        : const SizedBox(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.green,
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BookmarkPage()),
            );
          },
          child: const Icon(Icons.bookmark),
        ),
      ),
    );
  }
}
