import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/controllers/bottom_nav_bar_controller.dart';

import 'package:sweet_swipe/views/main_app/home_screen/home_screen.dart';
import 'package:sweet_swipe/widgets/buttons/red_button.dart';

import '../../../../../constants/colors.dart';

import '../../../../../constants/container_decoration.dart';
import '../../../../../controllers/cartt_controller.dart';
import '../../../../../models/cart_model.dart';
import '../../../../../widgets/buttons/backbutton.dart';
import '../../bottom_nav_bar.dart';
import '../random_colors.dart';
import 'check_out_screen.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  List<CartItem> cartItems = CartController().cartItems;

  List<Color?> randomColors = [];

  var cont = Get.put(Bottomnavbarcontroller());
  var cartcont = Get.put(CartController());

// Corrected the controller name.

  @override
  void initState() {
    CartController().onInit();
    cartItems = cartcont.cartItems;
    randomColors = List.generate(
      cartItems.length,
      (index) => RandomColor().getRandomLightColor(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<bool> dismissedItemFlags =
        List.generate(cartItems.length, (_) => false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    MyBackbutton(ontap: () {
                      cont.currentindex.value =
                          0; // Corrected the variable name.
                      Get.offAll(() => const HomeScreen());
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'My Cart',
                      style: GoogleFonts.openSans(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(
                              0xff022C41)), // Make sure this style is defined in constants/textstyle.dart.
                    ),
                  ],
                ),
              ),
              Obx(
                () {



                  return  cartItems.isEmpty?   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 90,),
                        Image(image: const AssetImage('images/empty.png'),width:MediaQuery.sizeOf(context).width*0.8 ,height:300 ,fit: BoxFit.fill,),
                        const SizedBox(height: 40,),
                        Text('Your Cart is Empty',style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff282828),
                        ),),
                    const SizedBox(height: 10,),
                    Text('Looks like you haven;t added\nanything to your cart yet.',style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff6A6A6A),
                    ),textAlign: TextAlign.center,)
                      ],
                    ),
                  ):   SizedBox(
                    height: (cartItems.length <= 2)
                        ? MediaQuery.of(context).size.height - 400
                        :null,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 180),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        Color _randomColor = randomColors[index]!;
                        CartItem item = cartItems[index];

                        return Column(
                          children: [
                            if (!dismissedItemFlags[index])
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 28.0),
                                child: Divider(
                                  color: Color(0xffD2D2D2),
                                  thickness: 0.3,
                                ),
                              ),
                            Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              background: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xffD3D1D8)
                                              .withOpacity(0.21),
                                          blurRadius: 25,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 15),
                                        )
                                      ],
                                    ),
                                    width: 52,
                                    height: 106,
                                    child: Text(
                                      'Delete?',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xffFF0000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onDismissed: (_) {
                                dismissedItemFlags[index] = true;
                                cartcont.removeFromCart(item);
                                setState(() {});
                                Fluttertoast.showToast(
                                  msg: "Item removed from cart!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              },
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        height: 106,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 130,
                                              height: 73,
                                              alignment: Alignment.centerRight,
                                              decoration: BoxDecoration(
                                                color: _randomColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(60),
                                                        bottomRight:
                                                            Radius.circular(
                                                                60)),
                                              ),
                                              child: item.image.contains('http')
                                                  ? Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: 88,
                                                      width: 150,
                                                      child: Image.network(
                                                        item.image,
                                                        height: 88,
                                                        width: 150,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    )
                                                  : Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: 85,
                                                      width: 113,
                                                      child: Image.asset(
                                                        item.image,
                                                        height: 85,
                                                        width: 113,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, top: 18),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cartItems[index].title,
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xff022C41)),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${item.quantity.toString()}item',
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff4F4F4F)),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    '\$${cartItems[index].price.toStringAsFixed(1)}',
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xff584F4F)),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 28.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 26,
                                          width: 26,
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              CartController()
                                                  .decrementQuantity(item);
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 11,
                                              color: Color(0xffDC626B),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          width: 35,
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xffDC626B),
                                                Color(0xffA6323A),
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                            ),
                                          ),
                                          child: Text(
                                            '${item.quantity}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 26,
                                          width: 26,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              CartController()
                                                  .incrementQuantity(item);
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 11,
                                              color: Color(0xffDC626B),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ),

        bottomNavigationBar: cartItems.isEmpty?const Bottomnavbar():Container(
          height: 194,
          padding: const EdgeInsets.all(8),
          width: MediaQuery.sizeOf(context).width,
          decoration: decorationcart_B_15_Y_5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        "Total: \$${cartcont.calculateTotalPrice().toStringAsFixed(1)}",
                        style: GoogleFonts.openSans(
                            fontSize: 20.16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff4F4F4F)),
                      ),
                    ),
                  ],
                ),
              ),
const SizedBox(height: 30,),
              GestureDetector(
              onTap: ()
                  {
                    Get.to(()=>const CheckOutScreen());

                  },

              child: const Redbutton(width: 0.7,text: 'Checkout',image: 'cart1')),
            ],
          ),
        ),
      ),
    );
  }
}
