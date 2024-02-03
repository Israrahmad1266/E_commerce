import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jatin_e_commerce/View/Pages/chat_gpt/user.dart';
import 'package:jatin_e_commerce/View/Pages/home_pagee.dart';

import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';
import 'package:jatin_e_commerce/View/Pages/subcategory.dart';
import 'package:jatin_e_commerce/model/categorymodel.dart';
import 'package:jatin_e_commerce/model/subcategorymodel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController1 extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  UserProfile userProfile = UserProfile();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // getProfile(getToken());
    getCategory();

    super.onInit();
  }

  Future<void> registerUser() async {
    try {
      // final name = nameController.text;
      // final email = emailController.text;
      // final phone = phoneController.text;
      // final password = passwordController.text;
      final url =
          'https://jatin-tagra-backend.vercel.app/api/v1/user/registration';
      final headres = {'Content-Type': 'application/json'};

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "fullName": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "password": passwordController.text,
        }),
        headers: headres,
      );
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          phoneController.text.isEmpty ||
          passwordController.text.isEmpty) {
        Get.snackbar('Required', 'All Field is Required');
      }
      {}
      if (response.statusCode == 200) {
        print('Register Succuessful');
        Get.to(LoginPage());
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error logging in: $error');
    }
  }

  Future<void> loginUser() async {
    try {
      final url = 'https://jatin-tagra-backend.vercel.app/api/v1/user/login';
      final headers = {'Content-Type': 'application/json'};

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "email": loginemailController.text,
          "password": loginpasswordController.text,
        }),
        headers: headers,
      );
      if (loginemailController.text.trim().isEmpty ||
          loginpasswordController.text.trim().isEmpty) {
        Get.snackbar(
            backgroundColor: Colors.redAccent,
            "Alert",
            'Please Enter your Email & Password');
        return;
      }

      if (response.statusCode == 201) {
        final token = json.decode(response.body)['accessToken'];
        await saveToken(token);

        await getProfile(token);

        Get.snackbar(backgroundColor: Colors.green, 'Login', 'Welcome Back');
        Get.to(() => HomePage());
        print(response.body);
      } else if (response.statusCode == 404) {
        print('Login failed with status code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        Get.snackbar(
            backgroundColor: Colors.red, 'Not Register', 'User Not Found ');
      } else {
        print('Login failed with status code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        Get.snackbar(backgroundColor: Colors.red, 'Warning', 'Wrong Password ');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> getProfile(String token) async {
    try {
      final String? token = await getToken();
      if (token == '') {
        Get.snackbar('Error', 'Token not available');
        return;
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(
        Uri.parse('https://jatin-tagra-backend.vercel.app/api/v1/user/$token'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        userProfile = UserProfile.fromJson(json.decode(response.body));
        Get.snackbar('Success', 'Profile fetched successfully');
        print(response.body);
      } else {
        print("Error: ${response.statusCode}");
        handleProfileError(response.statusCode);
      }
    } catch (error) {
      print('Error during profile retrieval: $error');
      Get.snackbar('Error', 'Failed to get Profile: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void handleLoginError(int statusCode) {
    if (statusCode == 404) {
      Get.snackbar('Error', 'User not found');
    } else {
      Get.snackbar('Error', 'Login failed with status code: $statusCode');
    }
  }

  void handleProfileError(int statusCode) {
    if (statusCode == 401) {
      Get.snackbar('Error', 'Unauthorized: Token is invalid or expired');
    } else {
      Get.snackbar('Error', 'Failed to get Profile: ${statusCode}');
    }
  }

  File? selectedImage;

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();

    super.onClose();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final statuses = await [
      Permission.storage, // Gallery permission
      Permission.camera,
    ].request();
    if (statuses[Permission.storage] == PermissionStatus.granted &&
        statuses[Permission.camera] == PermissionStatus.granted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        Get.snackbar(
            'Permission Error', 'Please grant gallery and camera permissions');
      }
    }
  }

  Future<void> updateProfile() async {
    try {
      final String? token = await getToken();
      if (token == null) {
        Get.snackbar('Error', 'Token not available');
        return;
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final Map<String, dynamic> requestBody = {
        'name': nameController.text,
        'phone': phoneController.text,
        'password': passwordController.text,

        // Add other fields as needed
      };

      final response = await http.put(
        Uri.parse(
            'https://jatin-tagra-backend.vercel.app/api/v1/user/updateProfile'),
        headers: headers,
        body: jsonEncode(requestBody),
      );
      if (nameController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar('Required', 'Please Enter Name and Password');
      }

      if (response.statusCode == 200) {
        // Refresh the profile after the update
        //getProfile();
        userProfile = UserProfile.fromJson(json.decode(response.body));
        Get.snackbar('Success', 'Profile updated successfully');
        Get.to(LoginPage());
        print(response.body);
      } else {
        print("Error: ${response.statusCode}");
        handleProfileError(response.statusCode);
      }
    } catch (error) {
      print('Error during profile update: $error');
      Get.snackbar('Error', 'Failed to update profile: $error');
    } finally {
      isLoading.value = false;
    }
  }

  //Get Category Api
  List<CategoryElement> categories = [];

  Future<void> getCategory() async {
    var url =
        'https://jatin-tagra-backend.vercel.app/api/v1/vendor/getCategory';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = Category.fromJson(json.decode(response.body));

        categories = jsonData.categories;
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
        Get.to(SubcategoryScreen(subcategories, categoryElement));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
