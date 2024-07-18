import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class UserprofilesectionItemWidget extends StatelessWidget {
  const UserprofilesectionItemWidget({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 306.h,
          width: 160.h,
          margin: EdgeInsets.only(bottom: 2.h),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 2.h,
                  width: 44.h,
                  margin: EdgeInsets.only(top: 8.h),
                  decoration: BoxDecoration(
                    color: appTheme.red400,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage103,
                    height: 248.h,
                    width: double.maxFinite,
                    radius: BorderRadius.circular(
                      20.h
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Catcher in the Rye",
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    "J.D. Salinger",
                    style: CustomTextStyles.bodySmallGray50001,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}