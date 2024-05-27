import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweet_swipe/widgets/text/gradient_tex.dart';
import 'package:sweet_swipe/constants/textstyle.dart';
import '../../../../controllers/home_bottom_list_controller.dart';
import 'product_detail_screen/product_detail_screen.dart';
import 'random_colors.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return CarouselSlider.builder(
      itemCount: homeController.products.length, // Use the product list from the controller
      itemBuilder: (context, index, realIndex) {
        Color _randomColor = RandomColor().getRandomLightColor();
        final product = homeController.products[index];

        return GestureDetector(
          onTap: () {
            Get.to(() => ProductDetailScreen(
              index: index,
              color: _randomColor,

            ));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  height: 412,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: _randomColor,
                    borderRadius: BorderRadius.circular(42.51),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Text(
                              product.title!,
                              style: k28_54_700_opnsans_022,
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                Icons.star,
                                color: Color(0xffFFB800),
                                size: 20,
                              ),
                            ),
                            Text(
                              product.rating!,
                              style: k17_4_600_opnsans_3E,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 21.41,
                            height: 21.41,
                            child: Image(
                              image: AssetImage('images/loc.png'),
                              width: 21.41,
                              height: 21.41,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 3,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              product.location!,
                              style: k14_27_600_opnsans_08c,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Mygradeinttext(
                              text: product.price!,
                              gradient: const LinearGradient(
                                colors: [Color(0xFFDC626B), Color(0xFFA6323A)],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                              ),
                              size: 26.43,
                              weight: FontWeight.w600,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('/ 1item', style: k18_5_400_opnsans_022),
                            ),
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              width: 62.48,
                              height: 62.48,
                              decoration: const BoxDecoration(
                                color: Color(0xff022C41),
                                shape: BoxShape.circle,
                              ),
                              child: const SizedBox(
                                width: 30.16,
                                height: 30.16,
                                child: Image(
                                  image: AssetImage('images/cart2.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Image(
                  image: AssetImage('images/${product.image!}.png'),
                  height: 288,
                  width: 257,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(height: 480, enlargeCenterPage: true, enableInfiniteScroll: false),
    );
  }
}
