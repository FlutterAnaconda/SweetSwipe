import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bottom_nav_bar_controller.dart';
import 'controllers/cartt_controller.dart';
import 'controllers/home_bottom_list_controller.dart';
import 'controllers/notification_controller.dart';
import 'views/on_boarding_screens/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
// getPages: [
//   GetPage(
//     name: "/SlidableScreen",
//     page: () => const SlidableScreen(),
//   ),
// ],
      theme: ThemeData(

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(Bottomnavbarcontroller());
        Get.put(CartController());
        Get.put(Notificationcontroller());
      }),
    );
  }
}

