import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/modifies_user_controller.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final UserController1 controller = Get.put(UserController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://d3nn873nee648n.cloudfront.net/900x600/20742/300-SM1072683.jpg'),
            fit: BoxFit.fill,
            opacity: 0.5,
            colorFilter: ColorFilter.matrix([
              0.5, 0.1, 0, 0, 1, // Red
              0, 0.5, 0, 0, 0, // Green
              0, 0, 0.5, 0, 1, // Blue
              0, 0, 0, 1, 1,
            ]),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register Account',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ))),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: controller.nameController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        hintText: 'jonson',
                        hintStyle: const TextStyle(
                            decorationThickness: 0.1,
                            color: Color.fromARGB(255, 121, 114, 114))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        hintText: 'example@gmail.com',
                        hintStyle: const TextStyle(
                            decorationThickness: 0.1,
                            color: Color.fromARGB(255, 121, 114, 114))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(
                            decorationThickness: 0.1,
                            color: Color.fromARGB(255, 121, 114, 114))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            )),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            decorationThickness: 0.1,
                            color: Color.fromARGB(255, 121, 114, 114))),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        controller.registerUser();
                      },
                      child: const Text(
                        'Register',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const Text(
            //   'Create Account',
            //   style: TextStyle(fontSize: 30, color: Colors.yellow),
            // ),
            // const SizedBox(height: 20),
            // buildTextField(controller.nameController, 'Name'),
            // const SizedBox(height: 20),
            // buildTextField(controller.emailController, 'Email'),
            // const SizedBox(height: 20),
            // buildPasswordTextField(controller.passwordController, 'Password'),
            // const SizedBox(height: 20),
            // buildPasswordTextField(
            //   controller.confirmPasswordController,
            //   'Confirm Password',
            // ),
            // const SizedBox(height: 15),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Register'),
            // ),
            // buildLoginTextButton(),
          ],
        ),
      ),
    );
  }

  // Widget buildTextField(TextEditingController controller, String hintText) {
  //   return TextFormField(
  //     controller: controller,
  //     decoration: InputDecoration(
  //       suffixIcon: const Icon(Icons.mail_outline),
  //       hintText: hintText,
  //       border: InputBorder.none,
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 20),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         borderSide: const BorderSide(color: Colors.yellow),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         borderSide: const BorderSide(color: Colors.yellow),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildPasswordTextField(
  //     TextEditingController controller, String hintText) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: TextFormField(
  //       controller: controller,
  //       style: const TextStyle(decoration: TextDecoration.none),
  //       decoration: InputDecoration(
  //         hintText: hintText,
  //         border: InputBorder.none,
  //         contentPadding: const EdgeInsets.symmetric(horizontal: 20),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(20),
  //           borderSide: const BorderSide(color: Colors.yellow),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(20),
  //           borderSide: const BorderSide(color: Colors.yellow),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildLoginTextButton() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Text(
  //         'Already have an account',
  //         style: TextStyle(color: Colors.yellow, fontSize: 16),
  //       ),
  //       TextButton(
  //         onPressed: () {
  //           // Navigate to login page
  //         },
  //         child: const Text(
  //           'Login',
  //           style: TextStyle(color: Colors.blue, fontSize: 16),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
