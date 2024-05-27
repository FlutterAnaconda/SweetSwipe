import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/textstyle.dart';
import 'package:sweet_swipe/widgets/buttons/red_button.dart';
import 'package:sweet_swipe/widgets/textfields/pinktextfield_without_prefix.dart';

import '../../../../../constants/colors.dart';
import '../../../../../widgets/buttons/backbutton.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    MyBackbutton(
                      ontap: () {

                        Get.back();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Edit Profile',
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff022C41),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,

                      children: [
                        Container(
                          height: 88,
                          width: 88,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF8A00),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                )
                              ]),
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              'https://media.npr.org/assets/img/2022/06/01/ap22146727679490-6b4aeaa7fd9c9b23d41bbdf9711ba54ba1e7b3ae-s800-c85.webp',
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 2,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffDC626B),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Transform.scale(
                                scale: 0.8,
                                child: Image.asset(
                                  'images/cam.png',
                                  // height: 30,
                                  // width: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Larry Davis',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff000000),
                      ),
                    ),
                    Text(
                      '@fawadhussain',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  bottom: 10
                ),
                child: Text(
                  'Full Name',
                  style: k13_36_500_dmsans_dc,
                ),
              ),
             const Padding(
               padding: EdgeInsets.only(
                 left: 24,
               ),
               child: PinkTextFieldWithoutprefix( hinttext: 'full name'),
             ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  bottom: 10
                ),
                child: Text(
                  'Email',
                  style: k13_36_500_dmsans_dc,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                ),
                child: PinkTextFieldWithoutprefix( hinttext: 'Email'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ),                child: Redbutton(width: 0.7, image: 'logout', text: 'Update'),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
