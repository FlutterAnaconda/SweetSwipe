import 'package:flutter/material.dart';

import '../../constants/container_decoration.dart';

class MyBackbutton extends StatelessWidget {
  final VoidCallback ontap;
  const MyBackbutton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
         
        

      
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: decorationbackredbutton,
        child: Container(alignment: Alignment.center,width: 21.79,height: 20,child: Transform.rotate(angle: 22,child: const Image(image: AssetImage('images/arrow.png'),fit: BoxFit.fill,))),
      ),
    );
  }
}
