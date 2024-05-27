import 'package:flutter/material.dart';

import '../../constants/textstyle.dart';
class PinkTextField extends StatelessWidget {
  final String imagepath;
  final String hinttext;


  const PinkTextField({super.key, required this.imagepath, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width*0.7,
      decoration: BoxDecoration(
        border: Border.all(width: 0.77,color: const Color(0xffDC626B),),
        borderRadius: BorderRadius.circular(13.56),
      ),
      child: TextFormField(

        style: k13_36_500_dmsans_dc,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(right: 20,top: 13),
          border: InputBorder.none,
          prefixIcon: Transform.scale(scale: 0.28,child: Image.asset('images/$imagepath.png')),
          hintText: hinttext,
          hintStyle: k13_36_500_dmsans_dc,
        ),
      ),
    );
  }
}
