import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (context, child) {
        return OrientationBuilder(
          builder: (context, orientation) {
            // Customize layout or perform logic based on orientation here
            // For example, you can use different themes or layouts
            return child!;
          },
        );
      },
    );
  }
}
