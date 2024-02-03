import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatin_e_commerce/View/Pages/chat_gpt/login_user.dart';
import 'package:jatin_e_commerce/View/Pages/forgot_password.dart';
import 'package:jatin_e_commerce/View/Pages/mobile_otp_controller.dart';

import 'package:jatin_e_commerce/View/Pages/signpage_test.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../Controller/modifies_user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController1 controller = Get.put(UserController1());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://d3nn873nee648n.cloudfront.net/900x600/20518/300-PS1047843.jpg'),
          fit: BoxFit.fill,
          opacity: 0.5,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login With Credentials',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controller.loginemailController,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.mail_outline),
                    hintText: 'Email',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0xff00783b),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xff00783b)),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controller.loginpasswordController,
                // obscureText: isPasswordVisibal,
                style: const TextStyle(
                  // suffixIcon: IconButton(
                  //     onPressed: () {
                  //       setState(() {});
                  //       isPasswordVisibal = !isPasswordVisibal;
                  //     },
                  //     icon: Icon(isPasswordVisibal
                  //         ? Icons.visibility
                  //         : Icons.visibility_off)),
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color(0xff00783b),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xff00783b)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 45,
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff00783b),
                  ),
                  onPressed: () {
                    controller.loginUser();
                  },
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(fontSize: 17, color: Colors.white)),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xff00783b),
                    side: const BorderSide(
                      color: Color(0xff00783b),
                    )),
                onPressed: () {
                  Get.to(SignPage());
                },
                child: Text(
                  'Sing Up',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Color(0xff00783b),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MobileOtp()));
              },
              child: Text(
                'forgot password ?',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
