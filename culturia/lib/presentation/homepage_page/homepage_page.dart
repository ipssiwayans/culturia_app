import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/categoriessection_item_widget.dart';
import 'widgets/userprofilesection_item_widget.dart';

class HomepagePage extends StatelessWidget {
  const HomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 62.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildWelcomeSection(context),
                    SizedBox(height: 12.h),
                    _buildCategoriesSection(context),
                    SizedBox(height: 22.h),
                    _buildTopMoviesSection(context),
                    SizedBox(height: 20.h),
                    _buildUserProfileSection(context),
                    SizedBox(height: 6.h),
                    _buildFeaturedFilmsSection(context)
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  // Section des Widgets
  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              'Bonjour Utilisateur',
              style: CustomTextStyles.bodyLargeGray60001,
            ),
          ),
          SizedBox(height: 4.h),
          Container(
            width: 246.h,
            margin: EdgeInsets.only(left: 4.h),
            child: Text(
              "Que voulez vous lire aujourd'hui ?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.25,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            height: 50.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                IntrinsicHeight(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 274.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.h,
                        vertical: 12.h,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgRewind,
                            height: 16.h,
                            width: 10.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 14.h,
                                bottom: 2.h,
                              ),
                              child: Text(
                                "Que recherchez vous ?",
                                style: CustomTextStyles.bodyMediumGray400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                  height: 48.h,
                  width: 98.h,
                  text: "Sort by",
                  buttonStyle: CustomButtonStyles.fillGrayTL101,
                  buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 24.h,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 28.h),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 30.h,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CategoriessectionItemWidget();
          },
        ),
      ),
    );
  }

  Widget _buildTopMoviesSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top 5 des films",
            style: theme.textTheme.headlineMedium,
          )
        ],
      ),
    );
  }

  Widget _buildUserProfileSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 308.h,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 28.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 40.h,
              );
            },
            itemCount: 3,
            itemBuilder: (context, index){
              return const UserprofilesectionItemWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedFilmsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 28.h),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Films",
                  style: CustomTextStyles.headlineMediumGray900,
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 268.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgImage103268x172,
                                height: 268.h,
                                width: double.maxFinite,
                                radius: BorderRadius.circular(
                                  20.h
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgAkarIconsHome,
                                height: 24.h,
                                width: 24.h,
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                  left: 36.h,
                                  top: 74.h,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 24.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgImage102,
                        height: 268.h,
                        width: 172.h,
                        radius: BorderRadius.circular(
                          20.h
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}