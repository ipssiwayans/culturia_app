import 'package:flutter/material.dart';

import '../core/app_export.dart';

enum BottomBarEnum { User, Close, Bookmark, Search }

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      type: BottomBarEnum.User,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgClose,
      activeIcon: ImageConstant.imgClose,
      type: BottomBarEnum.Close,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgBookmark,
      activeIcon: ImageConstant.imgBookmark,
      type: BottomBarEnum.Bookmark,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearch,
      activeIcon: ImageConstant.imgSearch,
      type: BottomBarEnum.Search,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.h,
      decoration: BoxDecoration(
        color: appTheme.whiteA70001,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.h),
          topRight: Radius.circular(50.h),
          bottomLeft: Radius.circular(40.h),
          bottomRight: Radius.circular(40.h),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 20.h,
              width: 20.h,
              color: appTheme.blueGray100,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 20.h,
              width: 20.h,
              color: appTheme.gray600,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          if (bottomMenuList[index].type != null) {
            widget.onChanged?.call(bottomMenuList[index].type!);
          }
          setState(() {});
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel(
      {required this.icon, required this.activeIcon, required this.type});

  String? icon;

  String? activeIcon;

  BottomBarEnum? type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('En cours de développement',
              style: TextStyle(
                fontSize: 18,
              ))
        ],
      )),
    );
  }
}
