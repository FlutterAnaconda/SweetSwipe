import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../constants/container_decoration.dart';
import '../../constants/textstyle.dart';
import '../../widgets/buttons/sigin_button.dart';
import '../main_app/home_screen/home_screen.dart';
class OtpCContentWidget extends StatelessWidget {
  const OtpCContentWidget({super.key});

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
              'Verification Code',
              style: k19_23_600_opnsans_022,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'A Code sent on m**@gmail.com',
              style: k11_52_400_opnsans_89,
            ),
            const SizedBox(
              height: 20,
            ),
 Pinput(
   mainAxisAlignment: MainAxisAlignment.center,
   animationCurve: Curves.bounceIn,
   keyboardType: TextInputType.number,
   defaultPinTheme: PinTheme(
     width: 52.87,
     height: 40.67,
     decoration: BoxDecoration(
       border: Border.all(color: const Color(0xffDC626B),width: 0.77),
       borderRadius: BorderRadius.circular(13.58),
     ),
     textStyle: GoogleFonts.openSans(
       fontWeight: FontWeight.w600,
       fontSize: 16.03,
       color: const Color(0xffDC626B),
       decoration: TextDecoration.none,

     )
   ),


 ),
            const SizedBox(
              height: 25,
            ),
            SigninButton(
                ontap: () {

                  Get.to(()=> HomeScreen());
                  // Future.delayed(const Duration(seconds: 1));
                  // Get.to(()=>)
                },
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.68,
                text: 'SignIn'),
            const SizedBox(height: 10,),
            Text('Resend Code',style: k11_3_500_inter_dc,)


          ],
        ),
      ),
    );
  }
}
