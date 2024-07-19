import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesSectionItemWidget extends StatefulWidget {
  final Function(int, String) onCategorySelected;

  const CategoriesSectionItemWidget(
      {super.key, required this.onCategorySelected});

  @override
  _CategoriesSectionItemWidgetState createState() =>
      _CategoriesSectionItemWidgetState();
}

class _CategoriesSectionItemWidgetState
    extends State<CategoriesSectionItemWidget> {
  List<Map<String, dynamic>> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/category/get-all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var categoryData = jsonResponse['categories'];
      setState(() {
        categories = List<Map<String, dynamic>>.from(categoryData.map(
            (category) => {'id': category['id'], 'name': category['name']}));
      });
    } else {
      print('Échec de la récupération des catégories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => InkWell(
                  onTap: () {
                    widget.onCategorySelected(category['id'], category['name']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      category['name'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
