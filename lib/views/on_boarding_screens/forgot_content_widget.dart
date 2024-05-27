import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/container_decoration.dart';
import '../../constants/textstyle.dart';
import '../../widgets/buttons/sigin_button.dart';
import '../../widgets/textfields/textfield.dart';
import 'otp_code_verification.dart';

class ForgotcontentWidget extends StatefulWidget {
   ForgotcontentWidget({super.key});

  @override
  State<ForgotcontentWidget> createState() => _ForgotcontentWidgetState();
}

class _ForgotcontentWidgetState extends State<ForgotcontentWidget> {
bool issend=false;
@override
  void initState() {
   issend=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.65,
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: decorationsignin_B_15_Y_5,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 55.01,
              width: 55.01,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffFFBCBC),
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(20.34)),
              child: Transform.scale(
                scale: 0.65,
                child: const Image(
                  image: AssetImage('images/Lock.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Forgot Password',
              style: k19_23_600_opnsans_022,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Enter your email to send OTP code',
              style: k11_52_400_opnsans_89,
            ),
            const SizedBox(
              height: 20,
            ),
            const PinkTextField(
              hinttext: 'Email id',
              imagepath: 'sms',
            ),
            const SizedBox(
              height: 25,
            ),
            SigninButton(
                ontap: () {

                  issend = true;
                  setState(() {

                  });
                  Future.delayed(const Duration(seconds: 1)

                  ).then((value) => Get.to(()=>const OtpCodeverification()));


                },
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.7,
                text: 'Continue'),
           const SizedBox(height: 10,),
           issend? Column(
             crossAxisAlignment: CrossAxisAlignment.center,

             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('We sent a  ',textAlign: TextAlign.center,style: k10_85_300_inter_dc,),
                   Text('Verification Code ',style: k10_85_600_inter_dc,),
                   Text('to your ',style: k10_85_300_inter_dc,),


                 ],

               ),
               Text('email address ',style: k10_85_300_inter_dc,),
             ],
           ):const SizedBox(),

          ],
        ),
      ),
    );
  }
}
