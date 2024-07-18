import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/init_page_screen/init_page_screen.dart';
import '../presentation/homepage_container_screen/homepage_container_screen.dart';

class AppRoutes {
  static const String initPageScreen = '/init_page_screen';

  static const String homepageContainerScreen = '/homepage_container_screen';

  static const String homepagePage = '/homepage_page';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    initPageScreen: (context) => const InitPageScreen(),
    homepageContainerScreen: (context) => HomepageContainerScreen(),

    initialRoute: (context) => const InitPageScreen(),
  };
}