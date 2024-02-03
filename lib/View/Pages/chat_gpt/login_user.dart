import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatin_e_commerce/View/Pages/chat_gpt/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();

  // Future<void> loginUser() async {
  //   try {
  //     final url = 'https://jatin-tagra-backend.vercel.app/api/v1/user/login';
  //     final headers = {'Content-Type': 'application/json'};

  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: jsonEncode({
  //         "email": loginemailController.text, // Replace with your credentials
  //         "password": loginemailController.text,
  //       }),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 201) {
  //       final token = json.decode(response.body)['accessToken'];
  //       await saveToken(token);
  //       await getProfile();
  //       print(userProfile);
  //       Get.snackbar('Success', 'Login successful');
  //     } else {
  //       handleLoginError(response.statusCode);
  //     }
  //   } catch (error) {
  //     print('Error during login: $error');
  //     Get.snackbar('Error', 'Failed to login: $error');
  //   }
  // }
}
