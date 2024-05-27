import 'package:flutter/material.dart';
import 'package:sweet_swipe/views/on_boarding_screens/signin_content_widget.dart';

import '../../constants/colors.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
        child: Container(
          height: screensize.height<600?screensize.height+100:screensize.height+30,
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
              Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: const AssetImage('images/bottom.png'),
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                    height: 120,
                  )),
               const Positioned(
                top: 135,
                // width: MediaQuery.of(context).size.width,
                child: SigninContentWidget(),
              ),

            ],
          ),
        ),
      ),
      )
    );
  }
}
