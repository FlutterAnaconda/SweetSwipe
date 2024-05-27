import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'signup_content_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Container(
            height: screensize.height<600?screensize.height+100:screensize.height+50,
            width: screensize.width,
            child: Stack(
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

                   const Positioned(
    top: 135,

    child: SignupContentWidget(),),
                Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: const AssetImage('images/bottom.png'),
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
