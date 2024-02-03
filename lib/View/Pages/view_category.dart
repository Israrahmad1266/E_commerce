import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jatin_e_commerce/model/subcategorymodel.dart';
import 'package:jatin_e_commerce/model/categorymodel.dart';
import 'package:jatin_e_commerce/View/Pages/subcategory.dart';

class CategoryApi extends StatefulWidget {
  const CategoryApi({Key? key}) : super(key: key);

  @override
  State<CategoryApi> createState() => _CategoryApiState();
}

class _CategoryApiState extends State<CategoryApi> {
  List<CategoryElement> categories = [];

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  Future<void> getCategory() async {
    var url =
        'https://jatin-tagra-backend.vercel.app/api/v1/vendor/getCategory';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = Category.fromJson(json.decode(response.body));

        setState(() {
          categories = jsonData.categories;
        });
      } else {
        print(
            'Request Failed with status ${response.statusCode}, message: ${json.decode(response.body)['message']}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getSubcategories(
      String categoryId, CategoryElement categoryElement) async {
    var url =
        'https://jatin-tagra-backend.vercel.app/api/v1/SubCategory/allSubcategoryById/$categoryId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final subCategoryData =
            Subcategory.fromJson(json.decode(response.body));

        // Assuming subCategoryData.data is a list of Datum
        List<Datum> subcategories = subCategoryData.data;

        // Now you can use the subcategories as needed, for example, display them in a new screen
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>

        //   ),
        // );
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) =>
                SubcategoryScreen(subcategories, categoryElement))));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(categories[index].image),
                        radius: 30,
                      ),
                    ],
                  ),
                  Text(categories[index].name),
                ],
              ),
            ),
            onTap: () {
              getSubcategories(categories[index].id, categories[index]);
            },
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
      // body: ListView.builder(
      //   itemCount: categories.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(categories[index].name),
      //       leading: CircleAvatar(
      //         backgroundImage: NetworkImage(categories[index].image),
      //       ),
      //       onTap: () {
      //         getSubcategories(categories[index].id, categories[index]);
      //       },
      //     );
      //   },
      // ),
    );
  }
}
