//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
//  Widget fillterBody() {
//
//   var valueIndex;
//   var selectedValue = valueIndex.first;
//   return StatefulBuilder(builder:
//       (BuildContext context,
//       StateSetter setState) {
//     return DropdownButton<String>(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 20),
//       isExpanded: true,
//       value: ,
//       icon: const Icon(
//           Icons.arrow_drop_down),
//       elevation: 16,
//       style: GoogleFonts.lato(
//         textStyle: const TextStyle(
//           fontSize: 16,
//           color: Color(0xff0a8523),
//         ),
//       ),
//       underline: Container(
//         height: 0.15,
//         color: Colors.grey,
//       ),
//       onChanged: (String? value) {
// // This is called when the user selects an item.
//         setState(() {
//           selectedValue = value! as bool;
//         });
//       },
//       items: valueIndex
//           .map<DropdownMenuItem<String>>(
//               (value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//     );
//   });
// }