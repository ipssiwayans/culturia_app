import 'package:culturia/homepage/homepage_bottom_bar/homepage_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';

class InitPageScreen extends StatelessWidget {
  const InitPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 38.h,
            vertical: 56.h,
          ),
          child: Column(
            children: [
              SizedBox(height: 44.h),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 310.h,
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 2.h),
              ),
              SizedBox(height: 84.h),
              Text(
                'Une communauté engagé',
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  "Culturia est une communauté d'entraide et de partage de connaissances sur l'agriculture urbaine et périurbaine.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumGray50001,
                ),
              ),
              SizedBox(height: 44.h),
              CustomElevatedButton(
                width: 194.h,
                text: "Commencer maintenant",
                buttonStyle: CustomButtonStyles.fillGrayTL10,
                buttonTextStyle: CustomTextStyles.titleSmallBold,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomepageContainerScreen()));
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
