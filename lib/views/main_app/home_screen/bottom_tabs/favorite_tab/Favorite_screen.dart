import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/colors.dart';
import 'package:sweet_swipe/views/main_app/home_screen/home_screen.dart';

import '../../../../../constants/list.dart';
import '../../../../../controllers/bottom_nav_bar_controller.dart';
import '../../../../../controllers/home_bottom_list_controller.dart';
import '../../../../../widgets/buttons/backbutton.dart';
import 'stagarred_grid_view.dart';
class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({super.key});
   final HomeController homeController = Get.find<HomeController>();

   Bottomnavbarcontroller navcontroller = Get.find<Bottomnavbarcontroller>();
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
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
                      'Favorite',
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff022C41),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 0.3,
                  color: Color(0xffD2D2D2),
                ),
              ),
              const SizedBox(height: 30),
             Obx(() =>    homeController.favproducts.isEmpty
             ? const Image(
             image: AssetImage('images/emptyfav.png'),
        width: 300,
        height: 300,
        fit: BoxFit.contain,
      )
        : MyStaggeredGridView()
    ),

              Obx(() => homeController.favproducts.isEmpty?Text('No Favorite Yet?',style:GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xff022C41),
              ),):const SizedBox(height: 100),)
            ],
          ),
        ),
      );

  }
}
