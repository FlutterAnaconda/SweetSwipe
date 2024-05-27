
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/list.dart';
import '../../../../../controllers/home_bottom_list_controller.dart';


class MyStaggeredGridView extends StatefulWidget {

  @override
  State<MyStaggeredGridView> createState() => _MyStaggeredGridViewState();
}

class _MyStaggeredGridViewState extends State<MyStaggeredGridView> {
  final HomeController homeController = Get.find<HomeController>();
  // @override
  // void initState() {
  //
  //   for(int i= 0;i<fav.length;i++)
  //     {
  //       fav[i].isfav = true;
  //     }
  //       super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(

       itemCount: homeController.products.length,
        shrinkWrap: true,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 30,mainAxisExtent: 161,),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
         // bool isodd= index/2 !=0;
          if(index >= homeController.favproducts.length)
            {
              return  const SizedBox();
            }
         return Transform.translate(offset: Offset(0,index.isOdd?30:0),
           child: Stack(
             alignment: Alignment.topRight,
             children: [
               Container(width: 150,
               decoration: BoxDecoration(

                 color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.05),
                     blurRadius: 15,
                     spreadRadius: 0,
                     offset: const Offset(0, 6),
                   ),
                 ],
               ),
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [

                     const SizedBox(height: 12,),
 Image(image: AssetImage('images/${homeController.favproducts[index].image!}.png'),height: 76,width:90.52 ,fit: BoxFit.contain,),
                     const SizedBox(height: 10,),

                     Text('${homeController.favproducts[index].title}', style: GoogleFonts.inter(
                       fontSize: 16,
                       fontWeight: FontWeight.w500,
                       color: const Color(0xff0D0140),
                     ),),
                     const SizedBox(height: 3,),

                     Text('${homeController.favproducts[index].price}', style: GoogleFonts.inter(
                       fontSize: 18,
                       fontWeight: FontWeight.w600,
                       color: const Color(0xff0D0140),
                     ),),

                   ],
                 ),

               ),
               IconButton(
                 style: ButtonStyle(
                   overlayColor: MaterialStateProperty.all(Colors.transparent)
                 ),
                 onPressed: () async {
                   setState(() {

                     homeController.isunfavorite(homeController.favproducts[index].title!,homeController.favproducts[index].image!,);
                   });



                  
                 },
                 icon: Container(
                   height:22 ,
                 width: 22,
                 alignment: Alignment.center,
                 decoration: const BoxDecoration(
                   shape: BoxShape.circle,
                   color: Color(0xffEDECEC)
                 ),
                 child:  Image(image: const AssetImage('images/fillheart1.png',),height: 11.05,width:11.52 ,color:homeController.favproducts[index].isfav? const Color(0xffFF0000):const Color(0xffA2A0A0),fit: BoxFit.contain,)),
               )
             ],
           ),

         );


        },


      ),
    );
  }
}