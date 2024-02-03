import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatin_e_commerce/View/Pages/home_pagee.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login() async {
    try {
      var headres = {'Content-Type': 'application/json'};
      var response = await http.post(
        Uri.parse('https://jatin-tagra-backend.vercel.app/api/v1/user/login'),
        headers: headres,
        body: json.encode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );
      if (response.statusCode == 200) {
        print('Login successful');
        Get.to(HomePage());
        print(response.body);
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error logging in: $error');
    }
  }
}
