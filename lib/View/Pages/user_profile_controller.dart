import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final IconData icon;
  final Color iconColor;

  final Function iconButton;

  double size;

  AppButton(
      {super.key,
      required this.size,
      required this.textColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.iconColor,
      required this.text,
      required this.iconButton,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(
          vertical: 10,
        )),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(right: 35)),
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.0,
                  color: borderColor,
                ),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              text,
              style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              width: 70,
            ),
            IconButton(
              onPressed: () {
                iconButton();
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.green,
                size: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
