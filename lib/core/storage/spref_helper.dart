import 'package:flutter_image_app/core/storage/spref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SprefHelper {
  final SharedPreferences _sharedPreferences;

  SprefHelper(this._sharedPreferences);

  Future<bool> setBookmarks(List<String> photos) async {
    return _sharedPreferences.setStringList(SprefKey.BOOKMARKS, photos);
  }

  List<String> getBookmarks() {
    return _sharedPreferences.getStringList(SprefKey.BOOKMARKS) ?? [];
  }
}
