import 'package:flutter/material.dart';
import 'package:jatin_e_commerce/model/subcategorymodel.dart';
import 'package:jatin_e_commerce/model/categorymodel.dart';

class SubcategoryScreen extends StatelessWidget {
  SubcategoryScreen(this.subcategories, this.element);
  final List<Datum> subcategories;
  final CategoryElement element;

  // final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(element.name),
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subcategories[index].name),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(subcategories[index].image),
            ),
            // You can add more details or actions here
          );
        },
      ),
    );
  }
}
