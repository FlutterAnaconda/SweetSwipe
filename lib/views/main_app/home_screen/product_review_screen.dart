import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/colors.dart';
import 'package:sweet_swipe/widgets/buttons/backbutton.dart';

import '../../../constants/textstyle.dart';
import '../../../widgets/myslider/myslider.dart';
import '../../../widgets/text/gradient_tex.dart';
import 'bottom_tabs/random_colors.dart';
class ProductReviewScreen extends StatelessWidget {
  final String image;
  final String price;
  final String rating;
  final String producttitle;
  final Color color;
   ProductReviewScreen({super.key, required this.color, required this.image, required this.price, required this.rating, required this.producttitle});
  double value=0;
  @override
  Widget build(BuildContext context) {
    final media= MediaQuery.sizeOf(context);
    return SafeArea(child: Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Row(
                children: [
                  MyBackbutton(ontap: () {
                    Get.back();
                  }),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                      'Reviews',
                    style: k24_600_opnsans_022,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              // color: Colors.amber,
              width: media.width*0.85 ,
              height: media.height*0.17,
              child: Stack(
                children: [
                  Positioned(

                    bottom:0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 100,top: 10),
                      width: media.width*0.85 ,
                      height:  media.height*0.12,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Row(


                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(producttitle,style: GoogleFonts.openSans(
                                color: const Color(0xff022C41),
                                fontSize: 13.3,
                                fontWeight: FontWeight.w700,
                              ),),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 13.41,
                                    height: 13.41,
                                    child: const Image(
                                      image: AssetImage('images/loc.png'),
                                      width: 13.41,
                                      height: 13.41,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 3,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      '15km',
                                      style: k6_65_600_opnsans_08c,

                                    ),
                                  ),
                                ],
                              ),
                              Mygradeinttext(
                                text:price,
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFDC626B), Color(0xFFA6323A)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                ),
                                size: 15.43,
                                weight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [


                                const Icon(
                                  Icons.star,
                                  color: Color(0xffFFB800),
                                  size: 20,
                                ),
                                Text(
                                  rating,
                                  style: k17_4_600_opnsans_3E,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                  Positioned(
                    top: 10,
                    left: 5,
                    child: Image(image:AssetImage('images/$image.png'),
                    width: 93,
                    height: 100,
                    fit: BoxFit.fill,
            ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0,top: 35),
              child: Row(

                children: [
                  SizedBox(
                    width: media.width*0.56,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {

                       index ==0?value=4:index ==1?value=8:index ==2?value=12:index ==3?value=16:index ==4?value=86:value=0;
                      return Padding(

                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${index + 1}',style: GoogleFonts.openSans(
                              color: const Color(0xff101817),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),),
                            const SizedBox(width: 5,),

                            index==0||index==1?MySliderbg(max: 100,min:0 ,onChanged: (value) {

                          },
                          value: value,


                          ):MySlider(max: 100,min:0 ,onChanged: (value) {

                            },
                              value: value,


                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text('${value.toInt()}%',style: GoogleFonts.openSans(
                                color: const Color(0xff828A89),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                          ],
                        ),
                      );
                    },),
                  ),
                  const SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 67,
                        height: 66,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
color: Colors.white
                        ),
child: Text(rating,style: GoogleFonts.openSans(
  color: const Color(0xff101817),
  fontSize: 28,
  fontWeight: FontWeight.w600,
),),
                      ),
                      const SizedBox(height: 18,),
                      SizedBox(
                        height: 16,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {

                            return     Icon(
                              Icons.star,
                              color: index==4?const Color(0xffF0F0F2):const Color(0xffFFB800),
                              size: 20,
                            );

                        },),
                      ),
                      const SizedBox(height: 10,),
                      Text('137 reviews',style: GoogleFonts.openSans(
                        color: const Color(0xff828A89),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
              child: Divider(color: Color(0xffD2D2D2),thickness: 0.3,),
            ),
            Padding(
              padding:  EdgeInsets.only(right:media.width*0.48,top: 10),
              child: Text('People Reviews',style: GoogleFonts.openSans(
                color: const Color(0xff4F4F4F),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(

                    children: [
                      Container(
                        height: 44,
                        width: 44,

                        margin: const EdgeInsets.only(bottom: 70),

                        decoration: BoxDecoration(
                          color: RandomColor().getRandomLightColor(),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(bottom: -5,child: Image(image: AssetImage('images/girl.png'),fit: BoxFit.cover,width: 48,height: 48,)),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: media.width*0.7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text('Kamala jawala',style:  GoogleFonts.openSans(
                                    color: const Color(0xff022C41),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  const Spacer(),
                                  Text('16 min',style:  GoogleFonts.openSans(
                                    color: const Color(0xff828A89),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2,),
                            Row(
                              children: [


                                const Icon(
                                  Icons.star,
                                  color: Color(0xffFFB800),
                                  size: 15,
                                ),
                                Text(
                                  rating,
                                  style: GoogleFonts.openSans(
                                    color: const Color(0xff979797),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width:media.width*0.7,
                              height: 60,
                              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a lkjfkldsn rkn kjewrngtioerw[ig wer  kjgh weorih tiwer hp otjrlk noiw twng[ irtn;hg trlk gneroi',maxLines: 3,style:  GoogleFonts.openSans(
                                color: const Color(0xff585858),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textStyle: const TextStyle(overflow: TextOverflow.ellipsis)
                              ),),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                );
              },),
            ),



          ],
        ),
      ),
    ));
  }
}
