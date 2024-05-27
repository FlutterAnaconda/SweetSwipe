import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/colors.dart';
import 'package:sweet_swipe/views/on_boarding_screens/signin_screen.dart';

import '../../../../../constants/list.dart';
import '../../../../../controllers/bottom_nav_bar_controller.dart';
import '../../../../../widgets/buttons/backbutton.dart';
import '../../home_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  Bottomnavbarcontroller navcontroller = Get.find<Bottomnavbarcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    MyBackbutton(
                      ontap: () {
                        navcontroller.currentindex.value = 0;
                        Get.offAll(const HomeScreen());
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff022C41),
                      ),
                    ),
                    const Spacer(),
                    IconButton(

                        onPressed: () {

                          Get.to(const EditProfile());
                        },
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        icon: const Image(
                          image: AssetImage('images/edit1.png'),
                          width: 35,
                          height: 35,
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
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
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profiletablist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      profiletablist[index].onpressed(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                              'images/${profiletablist[index].iconspath}.png'),
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          profiletablist[index].title,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(const SigninScreen());
              },
              child: Container(
                height: 48,
                width: 148,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFDC626B), Color(0xFFA6323A)],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('images/logout.png'),
                      width: 21.65,
                      height: 21.67,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Log Out',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffffffff),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
