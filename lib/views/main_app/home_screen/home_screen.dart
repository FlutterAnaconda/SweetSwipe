import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_swipe/constants/colors.dart';
import 'package:sweet_swipe/views/main_app/home_screen/bottom_nav_bar.dart';

import '../../../controllers/bottom_nav_bar_controller.dart';
import 'bottom_tabs/cart_tab/cart_screen.dart';
import 'bottom_tabs/favorite_tab/Favorite_screen.dart';
import 'bottom_tabs/home_tab.dart';
import 'bottom_tabs/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Bottomnavbarcontroller navcontroller = Get.find<Bottomnavbarcontroller>();
  @override
  void initState() {
    navcontroller.currentindex.value=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Obx(() {
            switch (navcontroller.currentindex.value) {
              case 0:
                return  const HomeTab();
              case 1:
                return  FavoriteScreen();
              case 2:

                return const CartTab();
              case 3:
                return ProfileScreen();
              default:
                return const SizedBox();
            }
          }),
        ),
      ),

    );
  }
}
