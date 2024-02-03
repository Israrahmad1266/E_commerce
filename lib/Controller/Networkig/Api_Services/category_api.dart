// // import 'dart:convert';

// // import 'package:get/get.dart';
// // import 'package:jatin_e_commerce/Controller/Networkig/categorymodel.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;

// // class ApiServices extends GetxController {
// //   Category? category;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchData();
// //   }

// //   Future<void> fetchData() async {
// //     try {
// //       final response = await http.get(Uri.parse(
// //           'https://jatin-tagra-backend.vercel.app/api/v1/user/categories'));

// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         // Parse the JSON response using the generated Dart classes
// //         Category parsedCategory = categoryFromJson(response.body);
// //         final token = json.decode(response.body)["_id"];
// //         SharedPreferences prefs = await SharedPreferences.getInstance();
// //         await prefs.setString('token', token);
// //         print(token);

// //         // Update the widget's state with the parsed data
// //         setState(() {
// //           category = parsedCategory;
// //         });
// //       } else {
// //         print('Request failed with status: ${response.statusCode}');
// //         print(response.reasonPhrase);
// //       }
// //     } catch (error) {
// //       // Handle errors, e.g., show an error message
// //       print('Error fetching data: $error');
// //     }
// //   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:jatin_e_commerce/Controller/Networkig/Api_Services/subcategorymodel.dart';
// import 'package:jatin_e_commerce/Controller/Networkig/categorymodel.dart';

// class CategoryApi extends StatefulWidget {
//   const CategoryApi({Key? key}) : super(key: key);

//   @override
//   State<CategoryApi> createState() => _CategoryApiState();
// }

// class _CategoryApiState extends State<CategoryApi> {
//   List<CategoryElement> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     getCategory();
//   }

//   Future<void> getCategory() async {
//     var url =
//         'https://jatin-tagra-backend.vercel.app/api/v1/vendor/getCategory';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final jsonData = Category.fromJson(json.decode(response.body));

//         setState(() {
//           categories = jsonData.categories;
//         });
//       } else {
//         print(
//             'Request Failed with status ${response.statusCode}, message: ${json.decode(response.body)['message']}');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> getSubcategories(String categoryId) async {
//     var url =
//         'https://jatin-tagra-backend.vercel.app/api/v1/SubCategory/allSubcategoryById/$categoryId';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final subCategoryData =
//             Subcategory.fromJson(json.decode(response.body));

//         // Assuming subCategoryData.data is a list of Datum
//         List<Datum> subcategories = subCategoryData.data;

//         // Now you can use the subcategories as needed, for example, display them in a new screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SubcategoryScreen(subcategories),
//           ),
//         );
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//       ),
//       body: ListView.builder(
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(categories[index].name),
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(categories[index].image),
//             ),
//             onTap: () {
//               getSubcategories(categories[index].id);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
