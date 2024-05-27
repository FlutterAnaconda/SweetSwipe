import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import 'forgot_content_widget.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                child: Image(
                  image: const AssetImage('images/top.png'),
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                )),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: const AssetImage('images/bottom.png'),
                  fit: BoxFit.cover,
                  width: MediaQuery.sizeOf(context).width,
                  height: 70,
                )),
             Positioned(
              top: 135,
              // width: MediaQuery.of(context).size.width,
              child: ForgotcontentWidget(),
            ),

          ],
        ),
      ),
    );
  }
}
