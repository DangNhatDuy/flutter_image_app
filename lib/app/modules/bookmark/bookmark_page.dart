import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_app/core/core.dart';
import 'package:get/get.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final SprefHelper _sprefHelper = Get.find<SprefHelper>();
  List<String> bookmarks = [];

  @override
  void initState() {
    super.initState();
    bookmarks = _sprefHelper.getBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    var item = bookmarks[index];
                    return SizedBox(
                      child: CachedNetworkImage(
                        imageUrl: item,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.red.shade400,
                        ),
                      ),
                    );
                  }),
                  childCount: bookmarks.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
