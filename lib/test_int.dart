// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:http/http.dart' as http;
// import 'package:jatin_e_commerce/View/Pages/home_pagee.dart';
// import 'package:jatin_e_commerce/View/Pages/user_profile_account.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController fnameController = TextEditingController();
//   TextEditingController lnameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController cpassController = TextEditingController();

//   Future<void> registerUser(BuildContext context) async {
//     final url =
//         'http://volantiscottsdale.mindwebtree.com/api/v1/customer/register';

//     final Map<String, dynamic> userData = {
//       "first_name": fnameController.text,
//       "last_name": lnameController.text,
//       "email": emailController.text,
//       "password": passController.text,
//       "password_confirmation": cpassController.text,
//     };

//     final response = await http.post(
//       Uri.parse(url),
//       body: userData,
//     );

//     if (response.statusCode == 200) {
//       print('User Register Successfully');
//       print(response.body);

//       Get.to(HomePage());
//     } else {
//       print('Registration failed: ${response.reasonPhrase}');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Registration failed: ${response.reasonPhrase}'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//       // Navigate to a different page or handle errors as needed
//       // For example, you can navigate to the user profile page on failure
//       Get.to(HomePage());
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Registration successful'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Register User'),
//             const SizedBox(
//               height: 35,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   hintText: 'First Name'),
//               controller: fnameController,
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   hintText: 'Last Name'),
//               controller: lnameController,
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   hintText: 'Email'),
//               controller: emailController,
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   hintText: 'Password'),
//               controller: passController,
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   hintText: 'ConfirmPass'),
//               controller: cpassController,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigo,
//                   ),
//                   onPressed: () {
//                     registerUser(context);
//                   },
//                   child: const Text(
//                     'Register User',
//                     style: TextStyle(fontSize: 20, color: Colors.black),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
