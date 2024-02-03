import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // File? selectedImage;

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   phoneController.dispose();

  //   super.onClose();
  // }

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();

  //   final statuses = await [
  //     Permission.storage, // Gallery permission
  //     Permission.camera,
  //   ].request();
  //   if (statuses[Permission.storage] == PermissionStatus.granted &&
  //       statuses[Permission.camera] == PermissionStatus.granted) {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       selectedImage = File(pickedFile.path);
  //     } else {
  //       Get.snackbar(
  //           'Permission Error', 'Please grant gallery and camera permissions');
  //     }
  //   }
  // }

  // RxBool isLoading = true.obs;

  // Future<void> getProfile1() async {
  //   try {
  //     final headers = {
  //       'Authorization':
  //           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGM2OWY5ODVjZDkxOTM2MTkxM2Y5ZiIsImlhdCI6MTcwMjU1MDM5MCwiZXhwIjoxNzAyODA5NTkwfQ.Mc3vgupZfqK07AN9OfKY0BTGjO64mCUW7xJR9YVYvZE'
  //     };
  //     final response = await http.get(
  //       Uri.parse(
  //           'https://jatin-tagra-backend.vercel.app/api/v1/vendor/getProfile'),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200) {
  //       final token = json.decode(response.body)['accessToken'];
  //       await saveToken(token);
  //     } else {
  //       Get.snackbar(
  //           'Error', 'Failed to get Profile: ${response.reasonPhrase}');
  //     }
  //   } catch (error) {
  //     print('Error during profile retrieval: $error');
  //     Get.snackbar('Error', 'Failed to get Profile: $error');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('token', token);
  // }

  //Future<void> updateProfile() {}
}
