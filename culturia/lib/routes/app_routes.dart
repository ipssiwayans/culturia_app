import 'package:flutter/material.dart';

import '../app/homepage_bottom_bar/homepage_bottom_bar.dart';
import '../app/init_page_screen/initial_screen.dart';
import '../app/add_items/add_item.dart';

class AppRoutes {
  static const String initPageScreen = '/init_page_screen';

  static const String homepageContainerScreen = '/homepage_container_screen';

  static const String homepagePage = '/homepage_page';

  static const String addItemPage = '/add_item_page';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    initPageScreen: (context) => const InitPageScreen(),
    homepageContainerScreen: (context) => HomepageContainerScreen(),
    addItemPage: (context) => const AddItemPage(),
    initialRoute: (context) => const InitPageScreen(),
  };
}
