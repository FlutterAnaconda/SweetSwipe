import 'package:flutter/material.dart';

import '../../constants/textstyle.dart';
class PinkTextFieldWithoutprefix extends StatelessWidget {

  final String hinttext;


  const PinkTextFieldWithoutprefix({super.key,  required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.sizeOf(context).width*0.77,
      decoration: BoxDecoration(
        border: Border.all(width: 0.77,color: const Color(0xffDC626B),),
        borderRadius: BorderRadius.circular(13.56),
      ),
      child: TextFormField(

        style: k13_36_500_dmsans_dc,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,

          hintText: hinttext,
          hintStyle: k13_36_500_dmsans_dc,
        ),
      ),
    );
  }
}