import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textcolor,
      required this.borderRadius,
      required this.text,
      this.onPressed});
  final Color backgroundColor;
  final Color textcolor;
  // final String text;
  final BorderRadius? borderRadius;
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.bold, color: textcolor),
        ),
      ),
    );
  }
}
