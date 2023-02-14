import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_app/injector.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBinding.instance.initData();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gallery App',
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: Routes.HOME,
      initialBinding: InitialBinding.instance,
    );
  }
}
