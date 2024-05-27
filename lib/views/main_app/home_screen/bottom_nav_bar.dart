import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_swipe/controllers/bottom_nav_bar_controller.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({Key? key}) : super(key: key);

  static const List<String> image = ['n1', 'heart11', 'n3', 'n4'];

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  Bottomnavbarcontroller navcontroller = Get.find();



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 92,
      width: MediaQuery.of(context).size.width*0.94,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffA9AEB1).withOpacity(0.09),
            blurRadius: 24.5,
            spreadRadius: 0,
            offset: const Offset(0, 7.37),
          )
        ],
        borderRadius: BorderRadius.circular(48.22),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Bottomnavbar.image.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22),
            child: Obx(()=>Column(
              children: [
                GestureDetector(
                  onTap: () {
                    navcontroller.currentindex.value = index;
                  },
                  child:Image(
                    image: AssetImage('images/${Bottomnavbar.image[index]}.png'),
                    height: 36,
                    width: 36,
                    fit: BoxFit.contain,
                    color: navcontroller.currentindex.value == index
                        ? const Color(0xffDC626B)
                        : const Color(0xffABAEB1),
                  ),
                ),
                const SizedBox(height: 5,),
                navcontroller.currentindex.value == index
                    ? Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffDC626B),
                  ),
                )
                    : const SizedBox(),
              ],
            ),)

          );
        },
      ),
    );
  }
}
