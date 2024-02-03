import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatin_e_commerce/Controller/modifies_user_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final UserController1 userController1 = Get.put(UserController1());
  final UserController1 controller1 = Get.put(UserController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 80,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  'Edit Profile',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const CircleAvatar(
              radius: 60,
            ),
            TextButton(
              onPressed: () {
                userController1.pickImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: userController1.selectedImage != null
                    ? FileImage(userController1.selectedImage!)
                    : null,
                child: userController1.selectedImage == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 40,
                      )
                    : null,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: userController1.nameController,
                    decoration: InputDecoration(
                      label: Text('Name'),
                      hintText: controller1.userProfile.data!.fullName,
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 17),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  TextFormField(
                    controller: controller1.passwordController,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      hintText:
                          controller1.userProfile.data!.password.toString(),
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 17),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                backgroundColor: Colors.green,
                minimumSize: const Size(380, 50),
              ),
              onPressed: () {
                userController1.updateProfile();
              },
              child: Text(
                'Update',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
