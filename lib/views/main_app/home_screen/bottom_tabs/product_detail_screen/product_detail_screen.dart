import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_swipe/constants/textstyle.dart';
import 'package:sweet_swipe/models/productmodel.dart';
import 'package:sweet_swipe/views/main_app/home_screen/product_review_screen.dart';
import 'package:sweet_swipe/widgets/text/gradient_tex.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/list.dart';
import '../../../../../controllers/cartt_controller.dart';
import '../../../../../controllers/home_bottom_list_controller.dart';
import '../../../../../models/cart_model.dart';
import '../../../../../widgets/buttons/backbutton.dart';
import '../../../../../widgets/buttons/red_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final Color color;
   final int index;

   ProductDetailScreen(
      {super.key,
      required this.index, required this.color});
  static List<ProductModel> detailslist = [
    ProductModel(title: 'Serving Weight', subtitle: '300g'),
    ProductModel(title: 'Reviews', subtitle: '1.5 months'),
    ProductModel(title: 'Calories (100g)', subtitle: '450 kcal'),
    ProductModel(title: 'Sweetness', subtitle: 'Sugar'),
  ];

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.blue,
                width: media.width,
                height: 492,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Image(
                          image: const AssetImage('images/producttop.png'),
                          color: widget.color,
                          width: media.width,
                          height: 470,
                          fit: BoxFit.fill,
                        )),

                    Positioned(
                        top: 10,
                        left: 10,
                        child: MyBackbutton(ontap: () {
                          Get.back();
                        })),
                    Positioned(
                        top: 15,
                        left: 80,
                        child: Text(
                          homeController.products[widget.index].title!,
                          style: k24_600_opnsans_022,
                        )),
                    Positioned(
                        bottom: 0,
                        child: Image(
                          image: AssetImage('images/${homeController.products[widget.index].image!}.png'),
                          width: media.width,
                          height: 411,
                          fit: BoxFit.fill,
                        )),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {

                            homeController.products[widget.index].isfav==true? homeController.isunfavorite(homeController.products[widget.index].title!,homeController.products[widget.index].image!):homeController.isfavorite(widget.index,homeController.products[widget.index].title!,homeController.products[widget.index].image!,homeController.products[widget.index].price!);

                            setState(() {

                            });

                        },
                        child: homeController.products[widget.index].isfav
                            ? const Image(
                          image: AssetImage('images/fillheart1.png'),
                          color: Color(0xffFF0000),
                          width: 42,
                          height: 46,
                          fit: BoxFit.contain,
                        )
                            : const Image(
                          image: AssetImage('images/fav.png'),
                          width: 45,
                          height: 45,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: media.width*0.7.toDouble()),
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: (){
                    Get.to(ProductReviewScreen(color: widget.color, image: homeController.products[widget.index].image!, price: homeController.products[widget.index].price!, rating:homeController.products[widget.index].rating!, producttitle: homeController.products[widget.index].title!));
                  },
                  child: Text('See Reviews',
                    style: k10_85_300_opensans_dc,),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: media.width * 0.15,
                  ),
                  Text(
                    'Total: ${homeController.products[widget.index].price!}',
                    style: k20_61_400_opnsans_4F,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 2.0,
                    ),
                    child: Icon(
                      Icons.star,
                      color: Color(0xffFFB800),
                      size: 16,
                    ),
                  ),
                  Text(
                    homeController.products[widget.index].rating!,
                    style: k17_4_600_opnsans_3E,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 82,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                    width: media.width * 0.25,
                    height: 82,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ProductDetailScreen.detailslist[index].title!,
                          style: k16_600_opnsans_89,
                        ),
                        Mygradeinttext(
                          text:
                              ProductDetailScreen.detailslist[index].subtitle!,
                          size: 18,
                          weight: FontWeight.w700,
                          gradient: const LinearGradient(
                            colors: [Color(0xFFDC626B), Color(0xFFA6323A)],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  final cartController = Get.find<CartController>();
                  CartItem newItem = CartItem(
                    title: homeController.products[widget.index].title!,
                    image: 'images/${homeController.products[widget.index].image!}.png',
                    price: 24,
                    quantity: 1,
                  );
                  cartController.addToCart(newItem);
                },
                child: const Redbutton(width: 0.7,image: 'cart2',text: 'Add to Cart'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
