import 'package:flutter/material.dart';
class LoginwithButton extends StatelessWidget {
  final String image;
  const LoginwithButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:44 ,
      width: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color:const Color(0xffFFBCBC),width: 1 )
      ),
      child: Transform.scale(scale: 0.75,child: Image(image: AssetImage('images/$image.png'),fit: BoxFit.contain,)),
    );
  }
}
