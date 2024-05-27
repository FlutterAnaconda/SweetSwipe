import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_swipe/views/on_boarding_screens/signup_screen.dart';

import '../../constants/container_decoration.dart';
import '../../constants/textstyle.dart';
import '../../widgets/buttons/sigin_button.dart';
import '../../widgets/textfields/textfield.dart';
import '../main_app/home_screen/home_screen.dart';
import 'forgot_screen.dart';
import 'loginwithbutton.dart';

class SigninContentWidget extends StatefulWidget {

  const SigninContentWidget({super.key,  });

  @override
  State<SigninContentWidget> createState() => _SigninContentWidgetState();
}

class _SigninContentWidgetState extends State<SigninContentWidget> {

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.sizeOf(context).height<500?MediaQuery.sizeOf(context).height*0.75:MediaQuery.sizeOf(context).height * 0.67,

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
                  image: AssetImage('images/person.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Welcome Back!',
              style: k19_23_600_opnsans_022,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Enter your full information below!',
              style: k11_52_400_opnsans_89,
            ),
            const SizedBox(
              height: 10,
            ),

            const PinkTextField(
              hinttext: 'Email id',
              imagepath: 'sms',
            ),
            const SizedBox(
              height: 8,
            ),
            const PinkTextField(
              hinttext: 'Password',
              imagepath: 'eye',
            ),
            // const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>const Forgotpassword());

                    },
                    child:  Text('Forgot Password?',style: k10_85_300_inter_dc,),),
                ],
              ),),




            const SizedBox(height: 28,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.0),
              child: Image(image: AssetImage('images/or.png')),
            ),
            const SizedBox(height: 15,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginwithButton(image: 'fb'),

                SizedBox(width: 8,),
                LoginwithButton(image: 'google'),

              ],
            ),
            const SizedBox(height: 15,),

            SigninButton(ontap: (){

              Get.to(()=> const HomeScreen());
            }, height: 50, width: MediaQuery.sizeOf(context).width*0.7, text: 'Sign In'),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.off(()=> const SignupScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?',style: k11_3_300_opensans_ff,),

                  Text('Sign up',style: k11_3_300_opensans_dc,),



                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
