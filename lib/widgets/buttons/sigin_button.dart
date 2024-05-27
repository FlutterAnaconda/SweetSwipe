import 'package:flutter/material.dart';

import '../../constants/textstyle.dart';
class SigninButton extends StatelessWidget {
  final VoidCallback ontap;
  final double height;
  final double width;
  final String text;

  const SigninButton({super.key, required this.ontap, required this.height, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [
            Color(0xffDC626B),
            Color(0xffA6323A),

          ],
            begin: Alignment.centerLeft,
            end:Alignment.centerRight,

          ),
        ),
        child: Text(text,style: k16_500_dmsans_fffff,),
      ),
    );
  }
}
