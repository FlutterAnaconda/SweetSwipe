  import 'package:flutter/material.dart';
import 'package:get/get.dart';
  import 'package:sweet_swipe/constants/list.dart';
  import 'package:sweet_swipe/constants/textstyle.dart';
  import 'package:sweet_swipe/views/main_app/home_screen/bottom_tabs/random_colors.dart';
import 'package:sweet_swipe/views/main_app/home_screen/bottom_tabs/slider.dart';
import 'package:sweet_swipe/views/main_app/home_screen/notification_screen.dart';

import '../../../../controllers/notification_controller.dart';
import '../bottom_nav_bar.dart';
  class HomeTab extends StatefulWidget {
    const HomeTab({super.key});

    @override
    State<HomeTab> createState() => _HomeTabState();
  }

  class _HomeTabState extends State<HomeTab> {
    List<Color?> randomColors = [];
    Notificationcontroller noti = Get.find<Notificationcontroller>();
    @override
    void initState() {
      super.initState();
      // Generate random colors only once and store them in the list
      for (int i = 0; i < hometoplist.length; i++) {
        randomColors.add(RandomColor().getRandomLightColor());
      }
    }
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 22.0),
                          child: Text('Good Morning\nDavid Jam!',style: k28_600_opnsans_022,),
                        ),
                        Obx(() =>  IconButton(

                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent)
                            ),onPressed: (){
                          Get.to( NotificationScreen());
                        },icon:  Image(image: AssetImage(noti.notification.isEmpty?'images/noti1.png':'images/noti.png'),width: 40,height: 40,fit: BoxFit.contain,))),

                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                    child: Divider(color: Color(0xffD2D2D2),thickness: 0.3,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0),
                    child: Text('Categories',style: k18_600_opnsans_028,),
                  ),

                  SizedBox(

                    height: 175,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: hometoplist.length,
                      itemBuilder: (context, index) {
                        bool first = index == 0;
                        final Color? _randomColor = randomColors[index];

                        return GestureDetector(
                          onTap: () {

                            for (int i = 0; i < hometoplist.length; i++) {
                              if (hometoplist[i].istapped == true) {
                                hometoplist[i].istapped = false;
                              }
                            }
                            hometoplist[index].istapped = true;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              width: 68,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: hometoplist[index].istapped == false
                                //     ? Colors.white
                                //     : Colors.transparent,
                                gradient: hometoplist[index].istapped == false
                                    ? null
                                    : const LinearGradient(
                                  colors: [
                                    Color(0xffDC626B),
                                    Color(0xffA6323A),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  hometoplist[index].istapped == false
                                      ? BoxShadow(
                                    color: const Color(0xffD3D1D8).withOpacity(0.20),
                                    blurRadius: 11.82,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 20.3),
                                  )
                                      : BoxShadow(
                                    color: const Color(0xffDC626B).withOpacity(0.25),
                                    blurRadius: 11.82,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 20.3),
                                  )
                                ],
                              ),
                              child: first
                                  ? Text(
                                hometoplist[index].title!,
                                style: hometoplist[index].istapped == false
                                    ? k16_600_opnsans_085
                                    : k16_600_opnsans_ffffff,
                              )
                                  : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 5,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: hometoplist[index].istapped == false
                                          ? _randomColor
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                      image:
                                      AssetImage('images/${hometoplist[index].image}.png'),
                                      width: 31.43,
                                      height: 31.43,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    hometoplist[index].title!,
                                    style: hometoplist[index].istapped == false
                                        ? k11_600_opnsans_085
                                        : k11_600_opnsans_ffffff,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Popular',style: k18_600_opnsans_028,),
                        const Image(image: AssetImage('images/down.png'),width:24,height:24,fit:BoxFit.contain)
                      ],
                    ),
                  ),
    const MySlider(),

                  const SizedBox(height: 150,)
                ],
              ),
            ),
            const Positioned(bottom: -10,child: Bottomnavbar()),
          ],
        ),
      );
    }
  }
