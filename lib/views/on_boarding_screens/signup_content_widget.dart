import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_swipe/views/on_boarding_screens/signup_screen.dart';

import '../../constants/container_decoration.dart';
import '../../constants/textstyle.dart';
import '../../widgets/buttons/sigin_button.dart';
import '../../widgets/textfields/textfield.dart';
import 'loginwithbutton.dart';
import 'signin_screen.dart';
class SignupContentWidget extends StatefulWidget {

   const SignupContentWidget({super.key, });

  @override
  State<SignupContentWidget> createState() => _SignupContentWidgetState();
}

class _SignupContentWidgetState extends State<SignupContentWidget> {
  bool ischecked=false;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.sizeOf(context).height<600?MediaQuery.sizeOf(context).height*0.8:MediaQuery.sizeOf(context).height * 0.72,
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: decorationsignin_B_15_Y_5,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
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
              'Create an Account',
              style: k19_23_600_opnsans_022,
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              'Enter your full information below!',
              style: k11_52_400_opnsans_89,
            ),
            const SizedBox(
              height: 10,
            ),
            const PinkTextField(
              hinttext: 'Username',
              imagepath: 'profile',
            ),
            const SizedBox(
              height: 8,
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
                children: [
                  GestureDetector(
                    onTap: () {
                      ischecked = !ischecked;
                      setState(() {});
                    },
                    child: Container(
                      height: 19.95,
                      width: 19.95,alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xffE9ECF3),
                        borderRadius:
                        BorderRadius.all(Radius.circular(5.42)),
                      ),
                      child: ischecked?const Icon(Icons.check,size: 15,color: Color(0xffDC626B),):const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Text('Remember me',style: k9_28_400_dmsans_dc,),

                ],
              ),
            ),
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

            SigninButton(ontap: (){}, height: 50, width: MediaQuery.sizeOf(context).width*0.7, text: 'Create Account'),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.offAll(()=> const SigninScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: k11_3_300_opensans_ff,),


                  Text('Sign in',style: k11_3_300_opensans_dc,),



                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
