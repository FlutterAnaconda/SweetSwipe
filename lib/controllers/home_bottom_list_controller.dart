import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../models/productmodel.dart';

class HomeController extends GetxController {
  final products = <ProductModel>[
    ProductModel(
        title: 'Cup Cakee',
        image: 'cake',
        rating: '4.9',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Cup Cake',
        image: 'cake',
        rating: '3.0',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Brithday Cake',
        image: 'b1',
        rating: '0.5',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Cup Cake',
        image: 'b2',
        rating: '3.5',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Cup Cake',
        image: 'b3',
        rating: '5.0',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Cup Cake',
        image: 'b4',
        rating: '3.0',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Cup Cake',
        image: 'b5',
        rating: '3.0',
        location: '15km',
        price: '\$25.05',
        isfav: false),
    ProductModel(
        title: 'Cup Cake',
        image: 'b6',
        rating: '3.0',
        location: '15km',
        price: '\$25.05',
        isfav: false),
  ].obs;
  final favproducts = <ProductModel>[].obs;
  // Example method to update the list
  void updateProductList(List<ProductModel> newList) {
    products.assignAll(newList);
  }

  void isfavorite(int index, String title, String image, String price) {
    bool isAlreadyFavorited = false;

    for (int i = 0; i < products.length; i++) {
      if (products[i].title == title && products[i].image == image) {
        products[i].isfav = true;
        break; // exit the loop once the item is found and unfavored
      }
    }
    // Check if the item is already in favproducts
    for (int i = 0; i < favproducts.length; i++) {
      if (favproducts[i].title == title && favproducts[i].image == image) {
        isAlreadyFavorited = true;
        break;
      }
    }

    if (isAlreadyFavorited) {
     // count==0? Fluttertoast.showToast(
     //      msg: 'already exist',
     //      backgroundColor: Colors.red,
     //      gravity: ToastGravity.BOTTOM,
     //      toastLength: Toast.LENGTH_SHORT,
     //      timeInSecForIosWeb: 1,
     //      fontSize: 14,
     //
     //      textColor: Colors.black):null;
     //  count++;
    } else {
      // The item is not already favorited, so add it to favproducts
      favproducts.add(ProductModel(
          title: title,
          image: image,
          rating: '4.9',
          location: '15km',
          price: price,
          isfav: true));
      update();
    }
  }

  void isunfavorite( String title, String image) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].title == title && products[i].image == image) {
        products[i].isfav = false;
        break; // exit the loop once the item is found and unfavored
      }
    }
    for (int i = 0; i < favproducts.length; i++) {
      if (favproducts[i].title == title && favproducts[i].image == image) {
        favproducts.removeAt(i);
        break; // exit the loop once the item is found and unfavored
      }
    }

   update();
  }

  // Add more methods as needed to interact with the product list

  static HomeController get to => Get.find<HomeController>();
}
