import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatin_e_commerce/View/Pages/home_pagee.dart';
import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';
import 'package:jatin_e_commerce/View/Pages/user_profile_account.dart';

import 'package:jatin_e_commerce/View/Pages/view_category.dart';
import 'package:jatin_e_commerce/sharedpref_file/prefs_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
