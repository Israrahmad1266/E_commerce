import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatin_e_commerce/View/Pages/forgot_password.dart';
import 'package:jatin_e_commerce/sharedpref_file/prefs_file.dart';

RxString userId = ''.obs;

class ApiController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  RxString otp = ''.obs;

  Future<void> fetchOtp() async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://jatin-tagra-backend.vercel.app/api/v1/user/loginWithPhone'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "phone": phoneController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        // Successful response
        var responseData = json.decode(response.body);
        otp.value = responseData['otp'];
        userId.value = responseData['userId'];
        SharedPreferencesHelper.setAuthToken('userId');

        Get.snackbar("Otp", otp.toString());
      } else {
        // Handle non-200 status codes
        print('Error: ${response.statusCode}, ${response.reasonPhrase}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle other errors (e.g., network issues)
      print('Error: $error');
    }
  }

  Future<void> verifyOtp(String user) async {
    try {
      final response = await http.post(
        Uri.parse('https://jatin-tagra-backend.vercel.app/api/v1/user/$user'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "otp": otpController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Successful response

        //userId.value = responseData['userId'];

        print(response.body);
        Get.to(ForgotPassword());

        Get.snackbar("Otp", otp.toString());
      } else {
        // Handle non-200 status codes
        print('Error: ${response.statusCode}, ${response.reasonPhrase}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle other errors (e.g., network issues)
      print('Error: $error');
    }
  }
}
//  try {
//       final url = 'https://jatin-tagra-backend.vercel.app/api/v1/user/$user';
//       final headers = {'Content-Type': 'application/json'};
//       final response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: json.encode({"otp": otpController.text.trim()}),
//       );

//       print('Verify OTP Response: ${response.statusCode}, ${response.body}');

//       if (response.statusCode == 200) {
//         final responseBody = json.decode(response.body);

//         if (responseBody['data'] != null &&
//             responseBody['data']['accessToken'] != null &&
//             responseBody['_id'] != null) {
//           // OTP verification successful, store user ID and navigate to the next screen
//           userId.value = responseBody['data']['accessToken'].toString();

//           SharedPreferencesHelper.setAuthToken(
//               responseBody['data']['accessToken'].toString());
//           SharedPreferencesHelper.setUserId(responseBody['_id']);
//           // Assuming the response contains the user ID
//           Get.to(ForgotPassword());
//         } else {
//           print('Error: Invalid response format - Missing required keys');
//           Get.snackbar('Error', 'Invalid response format');
//         }
//       } else if (response.statusCode == 400) {
//         print('Error: Invalid OTP');
//         Get.snackbar('Error', 'Invalid OTP');
//       } else {
//         // Handle other HTTP status codes
//         if (response.statusCode == 401) {
//           print('Error: Unauthorized');
//           Get.snackbar('Error', 'Unauthorized');
//           // Handle unauthorized access
//         } else {
//           print('Success: ${response.statusCode}, logged in successfully');
//           // Perform actions for successful login, if needed
//         }
//       }
//     } catch (error) {
//       print('Error: $error');
//       // Handle other errors (e.g., network issues) if needed
//       Get.snackbar('Error', 'An error occurred');
//     }