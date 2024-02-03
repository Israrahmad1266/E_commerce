import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  // Future<void> registerUser() async {
  //   var url = Uri.parse(
  //       'https://jatin-tagra-backend.vercel.app/api/v1/user/registration');

  //   // Replace with your API endpoint
  //   if (nameController.text.isEmpty ||
  //       emailController.text.isEmpty ||
  //       passwordController.text.isEmpty ||
  //       confirmPasswordController.text.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       'All field is required',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return;
  //   }
  //   if (passwordController.text != confirmPasswordController.text) {
  //     Get.snackbar(
  //       'Error',
  //       'Password and Confirm Password do not match',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );

  //     return;
  //   }
  //   var body = {
  //     'name': nameController.text,
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //     'confirmPassword': confirmPasswordController.text,
  //   };

  //   try {
  //     var response = await http.post(url, body: body);

  //     if (response.statusCode == 200) {
  //       // Handle successful registration
  //       print('User registered successfully');
  //     } else if (response.statusCode == 409) {
  //       Get.snackbar(
  //         'Error',
  //         'This email is already registered. Please login or use a different email.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     } else {
  //       // Handle registration failure
  //       print('Registration failed: ${response.reasonPhrase}');
  //     }
  //   } catch (error) {
  //     // Handle network error
  //     print('Error: $error');
  //   }
  // }
  // Future<void> loginUser() async {
  //   var url =
  //       Uri.parse('https://jatin-tagra-backend.vercel.app/api/v1/user/login');
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = json.encode({
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   });

  //   try {
  //     var response = await http.post(url, headers: headers, body: body);

  //     if (response.statusCode == 200) {
  //       print('User logged in successfully');
  //       print(response.body);

  //       // Save the authentication token to SharedPreferences
  //       saveToken(response.body);

  //       // Handle successful login
  //     } else {
  //       print('Failed to login. Status code: ${response.statusCode}');
  //       print(response.reasonPhrase);
  //     }
  //   } catch (error) {
  //     print('Error logging in: $error');
  //   }
  // }

  // Future<void> registerUser() async {
  //   try {
  //     var headers = {'Content-Type': 'application/json'};
  //     var response = await http.post(
  //       Uri.parse(
  //           'https://jatin-tagra-backend.vercel.app/api/v1/user/registration'),
  //       headers: headers,
  //       body: json.encode({
  //         "fullName": nameController.text,
  //         "email": emailController.text,
  //         "phone": phoneController.text,
  //         "password": passwordController.text,
  //       }),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 409) {
  //       print('User registered successfully');
  //       Get.to(LoginPage());
  //       print(response.body);
  //     } else {
  //       print('Failed to register user. Status code: ${response.statusCode}');
  //       print('Server error message: ${response.body}');
  //       saveToken(response.body);
  //     }
  //   } catch (e) {
  //     print('Exception during registration: $e');
  //   }
  // }

  // Future<void> saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('auth_token', token);
  //   print('Token saved: $token');
  //   update(); // Update listeners when the token changes
  // }

  // String? getToken() {
  //   SharedPreferences prefs = Get.find<SharedPreferences>();

  //   return prefs.getString('auth_token');
  // }

  // Future<void> loadToken() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();

  //   update();
  // }
  var responseMessage = ''.obs;
  var isLoading = false.obs;

  Future<void> registerUser() async {
    isLoading.value = true;

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse(
          'https://jatin-tagra-backend.vercel.app/api/v1/user/registration'),
    );
    request.body = json.encode({
      "fullName": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
    });
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.to(LoginPage());
        var responseBody = await response.stream.bytesToString();

        var parsedResponse = json.decode(responseBody);
        responseMessage.value = parsedResponse['message'];
      } else {
        responseMessage.value =
            response.reasonPhrase ?? 'Failed to register user';
      }
    } catch (e) {
      responseMessage.value = 'Error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
