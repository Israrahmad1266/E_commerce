import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatin_e_commerce/Controller/modifies_user_controller.dart';
import 'package:jatin_e_commerce/Controller/profile_edit_controller.dart';
import 'package:jatin_e_commerce/View/Pages/chat_gpt/login_user.dart';
import 'package:jatin_e_commerce/View/Pages/chat_gpt/user.dart';
import 'package:jatin_e_commerce/View/Pages/lohinpage_test.dart';
import 'package:jatin_e_commerce/View/Pages/update_profile.dart';
import 'package:jatin_e_commerce/View/Pages/user_profile_controller.dart';

import 'edit_profile.dart';

class ProfileAccount1 extends StatefulWidget {
  const ProfileAccount1({
    super.key,
  });

  @override
  State<ProfileAccount1> createState() => _ProfileAccount1State();
}

class _ProfileAccount1State extends State<ProfileAccount1> {
  final EditProfileController controller = Get.put(EditProfileController());
  final UserController1 controller1 = Get.put(UserController1());
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Account"),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Skip'),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: Row(
                children: [
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage:
                  //       AssetImage(controller1.userProfile.data!.image),
                  // ),
                  Expanded(
                    child: ListTile(
                      title: Text(controller1.userProfile.data!.id),
                      subtitle: Text(controller1.userProfile.data!.email),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(EditProfile());
                      },
                      child: const Text('Edit Profile')),
                ],
              ),
            ),
            Column(
              children: [
                AppButton(
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.edit,
                  iconColor: Colors.white,
                  text: 'Edit Profile ',
                  iconButton: () {
                    Get.to(EditProfile());
                  },
                ),
                AppButton(
                  iconButton: () {
                    Get.to(const LoginPage());
                  },
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.local_shipping_outlined,
                  iconColor: Colors.white,
                  text: 'shipping Address ',
                ),
                AppButton(
                  iconButton: () {
                    Get.to(const LoginPage());
                  },
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.history,
                  iconColor: Colors.white,
                  text: 'Order History',
                ),
                AppButton(
                  iconButton: () {
                    Get.to(const LoginPage());
                  },
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.art_track_outlined,
                  iconColor: Colors.white,
                  text: 'Track Order',
                ),
                AppButton(
                  iconButton: () {
                    Get.to(const LoginPage());
                  },
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.notifications_none,
                  iconColor: Colors.white,
                  text: 'Notification',
                ),
                AppButton(
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.wallet_outlined,
                  iconColor: Colors.white,
                  text: 'Cards',
                  iconButton: () {
                    Get.to(const LoginPage());
                  },
                ),
                AppButton(
                  size: 50,
                  textColor: Colors.white,
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  icon: Icons.logout,
                  iconColor: Colors.white,
                  text: 'Log Out ',
                  iconButton: () {
                    Get.off(const LoginPage());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
