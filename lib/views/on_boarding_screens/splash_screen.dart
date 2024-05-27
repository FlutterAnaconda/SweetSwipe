import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/textstyle.dart';
import 'walkthrough_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const WalkThroughScreen());
    });
  }







  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          width: media.width,
          height: media.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash.png',),
              fit: BoxFit.fill,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('images/s1.png'),width: 117.34,height:175 ,fit: BoxFit.contain,),
              Text('SweetSwipe',style: k40_700_opnsans_ffffff,)
            ],
          ),
        ),
      ),
    );
  }
}
