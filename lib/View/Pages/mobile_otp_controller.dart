import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jatin_e_commerce/Controller/mobil_otp_controller.dart';

class MobileOtp extends StatelessWidget {
  const MobileOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController controller = Get.put(ApiController());
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
        child: Column(
          children: [
            // First Row: OTP Entry

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.fetchOtp();
                  },
                  child: Text('Send OTP'),
                ),
              ],
            ),

            // Second Row: Verification
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.otpController,
                      decoration: InputDecoration(
                        labelText: 'Verification Code',
                      ),
                    ),
                  ),
                  // Obx(() {
                  //   if (controller.showOtp.value) {
                  //     return Column(
                  //       children: [
                  //         SizedBox(height: 20),
                  //         Text(
                  //           'OTP Code:',
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //         Text(controller.otp.value),
                  //       ],
                  //     );
                  //   } else {
                  //     return SizedBox.shrink();
                  //   }
                  // }),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic to verify OTP here
                      controller.verifyOtp(userId.value);
                    },
                    child: const Text('Verify'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
