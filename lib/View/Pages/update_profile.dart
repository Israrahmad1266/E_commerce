// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:jatin_e_commerce/Controller/profile_edit_controller.dart';

// class UpdateProfile extends StatefulWidget {
//   const UpdateProfile({super.key});

//   @override
//   State<UpdateProfile> createState() => _UpdateProfileState();
// }

// class _UpdateProfileState extends State<UpdateProfile> {
//   final EditProfileController controller = Get.put(EditProfileController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 200),
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   controller.pickImage();
//                 },
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: controller.selectedImage != null
//                       ? FileImage(controller.selectedImage!)
//                       : null,
//                   child: controller.selectedImage == null
//                       ? Icon(
//                           Icons.camera_alt,
//                           size: 40,
//                         )
//                       : null,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       backgroundColor: Colors.green,
//                     ),
//                     onPressed: () {},
//                     child: Text('Update',
//                         style: GoogleFonts.lato(
//                             textStyle: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                         )))),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
