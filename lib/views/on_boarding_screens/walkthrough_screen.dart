import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/container_decoration.dart';

import '../../constants/textstyle.dart';
import '../../widgets/text/gradient_tex.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final PageController controller = PageController();
int count=0;
@override
  void initState() {
  count=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (value) {
                  if (value > controller.page!.toInt()) {

                    count++;
                    print(count);

                    setState(() {

                    });
                  } else if (value <= controller.page!.toInt()) {

                    count--;
                   print(count);
                    setState(() {

                    });
                  }
                },
                children: [
                  buildpage(
                      '1',
                      context,
                      'Best Shipping Spot\nfor Fond of Sweets',
                      'join us and find more choice sweets'),
                  buildpage('2', context, 'Receive your order\nin few minutes ',
                      'Order easily what you want to'),
                  buildpage(
                      '3',
                      context,
                      'You will see newest\nproduct on daily',
                      'Order easily what you want to'),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 48.0,right:48 ,bottom:10 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   count > 1 ? const SizedBox() :  TextButton(
                       style: ButtonStyle(
overlayColor: MaterialStateProperty.all(Colors.transparent)
                       ),
                       onPressed: (){
                         Get.offAll(()=>const SigninScreen());
                       },
                       child: const Mygradeinttext(
                        text: 'Skip',
                        gradient: LinearGradient(
                          colors: [Color(0xFFDC626B), Color(0xFFA6323A)],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                         size: 18,
                         weight: FontWeight.w400,
                    ),
                     ),
                    GestureDetector(
                      onTap: ()
                      {

                        if(controller.page!<2) {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);

                        }
                        else
                          {
                            SystemChrome.setPreferredOrientations([]);
                 count=0;
                            Get.offAll(()=>const SigninScreen());
                          }


                      },
                      child: Container(
                        height: 78,
                        width: 78,
                        alignment: Alignment.center,
                        decoration: decorationredbutton,
                        child: Container(alignment: Alignment.center,width: 34,height: 34,child: const Image(image: AssetImage('images/arrow.png'),fit: BoxFit.fill,)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



Widget buildpage(
    String imagepath, BuildContext context, String boldtext, String thintext) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage('images/$imagepath.png'),
            height: MediaQuery.sizeOf(context).height * 0.7,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        child: Container(
          height: MediaQuery.sizeOf(context).height*0.7 ,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
           image: DecorationImage(
             image: AssetImage('images/shadow.png',),
             fit: BoxFit.cover,
           )
          ),
        ),
      ),
      Positioned(
        bottom: 55,

        child: Text(
          boldtext,
          style: k28_700_opnsans_022,
          textAlign: TextAlign.center,
        ),
      ),
      Positioned(
        bottom: 32,
        child: Text(
          thintext,
          style: k14_600_opnsans_aa,
        ),
      ),
    ],
  );
}
