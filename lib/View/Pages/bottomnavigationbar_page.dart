import 'package:flutter/material.dart';
import 'package:jatin_e_commerce/View/Pages/home_pagee.dart';
import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';
import 'package:jatin_e_commerce/View/Pages/signpage_test.dart';

class BottomnavigationBar extends StatefulWidget {
  const BottomnavigationBar({super.key});

  @override
  State<BottomnavigationBar> createState() => _BottomnavigationBarState();
}

class _BottomnavigationBarState extends State<BottomnavigationBar> {
  int _currentPage = 0;
  final List<Widget> pages = [
    HomePage(),
    LoginPage(),
    SignPage(),
  ];
  void onTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.indigo,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Account Balance',
          ),
        ],
        currentIndex: _currentPage,
        onTap: onTapped,
      ),
    );
  }
}
