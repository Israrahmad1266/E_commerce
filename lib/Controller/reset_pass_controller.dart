import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';

class ForgotPasswrdController extends GetxController {
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  Future<void> resetPassword(String user) async {
    try {
      final url =
          'https://jatin-tagra-backend.vercel.app/api/v1/user/resetPassword/$user';
      final headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGM2OWY5ODVjZDkxOTM2MTkxM2Y5ZiIsImlhdCI6MTcwMjU1MDM5MCwiZXhwIjoxNzAyODA5NTkwfQ.Mc3vgupZfqK07AN9OfKY0BTGjO64mCUW7xJR9YVYvZE',
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode({
          "newPassword": newpass.text,
          "confirmPassword": confirmPass.text,
        }),
      );

      print('Reset Password: ${response.statusCode}, ${response.body}');
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password changed successfully');
        print('User ID: $user');
        Get.to(LoginPage());
      } else {
        print('Error: ${response.statusCode}, ${response.reasonPhrase}');
        Get.snackbar('Error', 'Incorrect password');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
