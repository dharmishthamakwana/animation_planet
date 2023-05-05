import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'screen/view/homescreen.dart';
import 'screen/view/plenetviewScreen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
                name: '/',
                page: () => HomePage(),
                transition: Transition.fade),
            GetPage(
                name: '/view',
                page: () => PlanetViewPage(),
                transition: Transition.downToUp),
          ],
        );
      },
    ),
  );
}
