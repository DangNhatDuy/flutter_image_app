import 'package:flutter_image_app/app/data/data.dart';

import '../helper/ui_helper.dart';

class BaseController {
  showLoading() {
    UIHelper.showLoading();
  }

  hideLoading() {
    UIHelper.hideLoading();
  }

  handleErrorWithSnackbar(error) {
    if (error is AppException) {
      var message = error.message;
      UIHelper.showSnackbar('Error', message);
    }
  }
}
