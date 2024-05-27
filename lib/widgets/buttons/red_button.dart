import 'package:flutter/material.dart';

import '../../constants/textstyle.dart';
class Redbutton extends StatelessWidget {
  final double width;
  final String image;
  final String text;
  const Redbutton({super.key, required this.width, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.sizeOf(context).width * width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDC626B), Color(0xFFA6323A)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image(
            image: AssetImage('images/$image.png'),
            width: 21.65,
            height: 21.67,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: k15_600_opnsans_ffffff,
          )
        ],
      ),
    );
  }
}
