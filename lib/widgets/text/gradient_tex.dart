import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Mygradeinttext extends StatelessWidget {
  final String text;
     final  LinearGradient gradient;
     final double size;
     final FontWeight weight;
  const Mygradeinttext({super.key, required this.text, required this.gradient, required this.size, required this.weight});

  @override
  Widget build(BuildContext context) {

      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return gradient.createShader(bounds);
        },
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: size, // Adjust the font size as needed
            fontWeight: weight, // Adjust the font weight as needed
            color: Colors.white, // Adjust the text color as needed
          ),
        ),
      );

  }
}
