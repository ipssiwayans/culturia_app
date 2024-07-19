import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/categoriessection_item_widget.dart';

class HomepagePage extends StatefulWidget {
  const HomepagePage({Key? key}) : super(key: key);

  @override
  _HomepagePageState createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> topItems = [];
  String selectedCategoryName = 'Films';

  @override
  void initState() {
    super.initState();
    fetchItemsByCategory(1, 'Films');
  }

  void fetchItemsByCategory(int categoryId, String categoryName) async {
    var url =
        Uri.parse('http://10.0.2.2:8000/api/item/get-by-category/$categoryId');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        items = List<Map<String, dynamic>>.from(jsonResponse['items']);
        selectedCategoryName = categoryName;
      });
      fetchTopItemsByCategory(categoryId);
    } else {
      print(
          'Échec de la récupération des éléments pour la catégorie $categoryName');
    }
  }

  void fetchTopItemsByCategory(int categoryId) async {
    var url =
        Uri.parse('http://10.0.2.2:8000/api/item/get-top-rated/$categoryId');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        topItems = List<Map<String, dynamic>>.from(jsonResponse['items']);
        print(topItems);
      });
    } else {
      print(
          'Échec de la récupération des meilleurs éléments pour la catégorie $categoryId');
    }
  }

  String getValidImagePath(String? imagePath) {
    const String defaultImagePath = "assets/images/default.png";
    return imagePath == null || imagePath.isEmpty
        ? defaultImagePath
        : imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    _buildWelcomeSection(context),
                    SizedBox(height: 20.h),
                    _buildCategoriesSection(context),
                    SizedBox(height: 20.h),
                    _buildTopItemsSection(context),
                    _buildFeaturedItemsSection(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
              'Bonjour',
              style: CustomTextStyles.bodyLargeGray60001,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 280.h,
            margin: EdgeInsets.only(left: 4.h),
            child: Text(
              "Que voulez-vous rechercher aujourd'hui ?",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.25,
              ),
            ),
          ),
          SizedBox(height: 20.h),
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
                                "Tapez le nom d'un loisir",
                                style: CustomTextStyles.bodyMediumGray400,
                              ),
                            ),
                          ),
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
                ),
              ],
            ),
          ),
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
          itemCount: 1,
          itemBuilder: (context, index) {
            return CategoriesSectionItemWidget(
              onCategorySelected: (categoryId, categoryName) {
                fetchItemsByCategory(categoryId, categoryName);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopItemsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Top 5 des ${selectedCategoryName.toLowerCase()}",
              style: theme.textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 12.h),
          topItems.isNotEmpty
              ? SizedBox(
                  height: 250.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 40.h,
                      );
                    },
                    itemCount: topItems.length,
                    itemBuilder: (context, index) {
                      return _buildTopItemCard(topItems[index]);
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "Aucun élément trouvé",
                    style: TextStyle(fontSize: 16.h),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildTopItemCard(Map<String, dynamic> item) {
    return Container(
      width: 150.h,
      margin: EdgeInsets.only(bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: getValidImagePath(item['image']),
            height: 150.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(20.h),
          ),
          // SizedBox(height: 2.h),
          Text(
            item['title'],
            style: CustomTextStyles.bodyLargeGray60001,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // SizedBox(height: 4.h),
          Text(
            item['author'],
            style: TextStyle(
              fontSize: 14.h,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItemsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedCategoryName.isEmpty ? "Films" : selectedCategoryName,
            style: CustomTextStyles.headlineMediumGray900,
          ),
          SizedBox(height: 12.h),
          items.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _buildItemCard(items[index]);
                  },
                )
              : Center(
                  child: Text(
                    "Aucun élément trouvé",
                    style: TextStyle(fontSize: 16.h),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    return Container(
      height: 268.h,
      margin: EdgeInsets.only(bottom: 24.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: getValidImagePath(item['image']),
            height: 268.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(20.h),
          ),
        ],
      ),
    );
  }
}
