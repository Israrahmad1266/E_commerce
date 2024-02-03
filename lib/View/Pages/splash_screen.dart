import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jatin_e_commerce/View/Pages/home_pagee.dart';
import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    loggedIn();
    super.initState();
  }

  void loggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var isLoggedIn = prefs.getBool('Login');

    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
