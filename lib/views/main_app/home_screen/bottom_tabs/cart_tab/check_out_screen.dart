import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/colors.dart';
import 'package:sweet_swipe/widgets/buttons/backbutton.dart';
import 'package:sweet_swipe/widgets/buttons/red_button.dart';

import '../../../../../constants/list.dart';
import '../../../../../constants/textstyle.dart';
import '../../../../../controllers/cartt_controller.dart';
import '../../../../../widgets/textfields/pinktextfield_without_prefix.dart';
import '../../../../../widgets/textfields/pinktextfieldwithsufix.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedIndex = 0;
  int selectedIndex1 = 0;
  var cartcont = Get.put(CartController());
  var cartItems ;
  bool ispaid=true;

@override
  void initState() {
  cartItems = cartcont.cartItems;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: media.height>600?media.height+230:media.height+130,
            width: media.width,
            child: Column(
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
                        'Checkout',
                        style: k24_600_opnsans_022,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    height: media.height * 0.8,
                    width: media.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffA9AEB1).withOpacity(0.5),
                          offset: const Offset(0, 5),
                          blurRadius: 15,
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: media.width * 0.85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Address',
                                style: k18_600_opnsans_4f,
                              ),
                              const Image(
                                image: AssetImage('images/edit.png'),
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: checkout.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 8, top: 20, bottom: 20),
                                  width: media.width * 0.43,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? null
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: selectedIndex == index
                                        ? const LinearGradient(
                                            colors: [
                                              Color(0xFFDC626B),
                                              Color(0xFFA6323A)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          )
                                        : null,
                                    border: selectedIndex == index
                                        ? null
                                        : Border.all(
                                            color: const Color(0xffEAEAEA),
                                            width: 1),
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        checkout[index].title!,
                                        style: GoogleFonts.openSans(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : const Color(0xff898989),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Image(
                                        image: AssetImage(checkout[index].image!),
                                        width: 35,
                                        height: 35,
                                        fit: BoxFit.contain,
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Contact Information',
                          style: k18_600_opnsans_4f,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: checkoutedit.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: const Color(0xffDC626B),
                                              width: 0.68),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Image(
                                        image:
                                            AssetImage(checkoutedit[index].image!),
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.contain,
                                      )),
                                  const SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        checkoutedit[index].title!,
                                        style: k16_400_opnsans_4f,
                                      ),
                                      Text(
                                        checkoutedit[index].subtitle!,
                                        style: k14_600_opnsans_c5,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Image(
                                    image: AssetImage('images/edit.png'),
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Payment Method',
                          style: k18_600_opnsans_4f,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 15,bottom: 8),
                            scrollDirection: Axis.horizontal,

                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: paymentcheckout.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  selectedIndex1 = index;
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                      width: media.width*0.283,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border:selectedIndex1 == index?null: Border.all(color: const Color(0xffEAEAEA)),
                                    borderRadius: BorderRadius.circular(10),
                                    color: selectedIndex1 == index?null:Colors.white,
                                    gradient: selectedIndex1 == index?const LinearGradient(
                                      colors: [
                                        Color(0xffDC626B),
                                        Color(0xffA6323A),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ):null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                       Image(
                                        image: AssetImage(paymentcheckout[index].image!),
                                        width:index==1?80: 50,
                                        height: 35,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(paymentcheckout[index].title!,style: GoogleFonts.openSans(
                                        fontSize: 10.49,
                                        fontWeight: FontWeight.w600,
                                        color: selectedIndex1 == index?Colors.white:Colors.black,
                                      ),)
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: media.width*0.868,
                          child: TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                            onPressed: (){

                              showModalBottomSheet(context: context, builder: (context) {

                                return Container(
                                  width: media.width,

                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(34),topLeft: Radius.circular(34),),
                                      color: Colors.white,
                                    ),


                                    child:  SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [


                                          const SizedBox(height: 25,),
                                           Container( width: 60,height: 6,
                                               decoration: BoxDecoration(
                                                 color: const Color(0xffD2D2D2),
                                                 borderRadius: BorderRadius.circular(3)

                                           ),
                                           ),
                                          const SizedBox(height: 15,),
                                          Text('Add new card',style: GoogleFonts.openSans(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff282828),
                                          ),),
                                          const SizedBox(height: 30,),

                                          const PinkTextFieldWithoutprefix( hinttext: 'Name of card'),
                                          const SizedBox(height: 10,),

                                          const PinkTextFieldWithoutprefix( hinttext: 'Card Number'),
                                          const SizedBox(height: 10,),

                                          const PinkTextFieldWithsufix( imagepath: 'down1',hinttext: 'Expire Date'),
                                          const SizedBox(height: 10,),
                                          const PinkTextFieldWithoutprefix( hinttext: 'Cvv Code'),
                                          const SizedBox(height: 10,),
                                          SizedBox(
                                            width: media.width*0.77,
                                            child: Row(

                                              children: [


                                                    Container(
                                                      alignment: Alignment.center,
                                                      width: 24,
                                                      height: 24,
                                                      decoration: BoxDecoration(
                                                        color:Colors.white  ,
                                                        shape: BoxShape.circle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color(0xff323247).withOpacity(0.06),
                                                              blurRadius: 2,
                                                              offset: const Offset(0,2),
                                                              spreadRadius: 0,
                                                            ),
                                                            BoxShadow(
                                                              color: const Color(0xff323247).withOpacity(0.06),
                                                              blurRadius: 2,
                                                              offset: const Offset(0,2),
                                                              spreadRadius: 0,
                                                            )
                                                          ]
                                                      ),
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: 18.67,
                                                        height: 18.67,
                                                        decoration:  const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          gradient:  LinearGradient(
                                                            colors: [
                                                              Color(0xffDC626B),
                                                              Color(0xffA6323A),
                                                            ],
                                                            begin: Alignment.topLeft,
                                                            end: Alignment.bottomRight,
                                                          ),
                                                        ),
                                                        child: const Icon(Icons.check,color: Colors.white,size: 15,),
                                                      ),
                                                    ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text('Save Card Details',style: GoogleFonts.openSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color(0xff282828),
                                                ),)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 30,),
                                          GestureDetector(
                                              onTap: (){
                                                Get.back();

                                                showDialog(context: context, builder:
                                                (context) {
                                                  return Container(

                                                    child: AlertDialog(

surfaceTintColor: Colors.transparent,
                                                      backgroundColor: Colors.transparent,
                                                      shadowColor: Colors.transparent,

                                                      content: GestureDetector(
                                                        onTap: ()
                                                        { ispaid = ! ispaid;
                                                          Get.back();
                                                          setState(() {

                                                          });
                                                        },
                                                        child:  Image( image: AssetImage(ispaid?'images/like.png':'images/fail.png'),
                                                             height:304 ,
                                                             width: 409,
                                                            fit: BoxFit.contain),
                                                      ),
                                                    ),
                                                  );

                                                },);


                                              },
                                              child: const Redbutton(width: 0.77, image: 'order', text: 'Add Card')),
                                        ],
                                      ),
                                    ));
                              },);

                            },
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:16.13 ,
                                  height: 16.13,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: const Color(0xff585858),width:1.5 )
                                  ),
                                  child: const Icon(Icons.add,color: Color(0xff585858),size: 12,),
                                ),
                       const SizedBox(width: 5,),
                                Text('Add Card',style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: const Color(0xff585858)
                                ),)

                              ],
                            )
                            ),
                        ),
                        const SizedBox(height: 15,),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 15),
                          child: Divider(color: Color(0xffD2D2D2),thickness: 0.3,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width*0.9,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 10.0, top: 10),
                                    child: Text(
                                      "${cartItems.length} Items",
                                      style: GoogleFonts.openSans(
                                          fontSize: 16.03,
                                          color: const Color(0xff4F4F4F),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text(
                                      "Total: \$${cartcont.calculateTotalPrice().toStringAsFixed(2)}",
                                      style: GoogleFonts.openSans(
                                          fontSize: 20.16,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff4F4F4F)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40,),
                            GestureDetector(
                                onTap: (){
                                  Get.back();

                                },
                                child: const Redbutton(width: 0.7, image:'order' , text: 'Order Now'))
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
