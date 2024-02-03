import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatin_e_commerce/Controller/reset_pass_controller.dart';
import 'package:jatin_e_commerce/Controller/mobil_otp_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswrdController controller = Get.put(ForgotPasswrdController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/forgot-password.jpg',
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.newpass,
                      cursorColor: const Color(0xff00783b),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xff00783b),
                            )),
                        hintText: 'Create New Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff00783b),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                        controller: controller.confirmPass,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                        ),
                        cursorColor: const Color(0xff00783b),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          hintText: 'Confirm New Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xff00783b),
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xff00783b),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 13),
                backgroundColor: const Color(0xff00783b),
              ),
              onPressed: () {
                controller.resetPassword(userId.value);
              },
              child: Text(
                'Submit',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
