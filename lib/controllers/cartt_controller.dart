import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/cart_model.dart';



class CartController extends GetxController {
  final List<CartItem> _cartItems = [
    CartItem(title: 'Mango', image: 'images/cake.png', price: 24, quantity: 1),
    CartItem(title: 'Mango', image: 'images/c1.png', price: 24, quantity: 1),
    CartItem(title: 'Mango', image: 'images/c2.png', price: 24, quantity: 1),
    CartItem(title: 'Mango', image: 'images/c3.png', price: 24, quantity: 1),
    CartItem(title: 'Mango', image: 'images/c1.png', price: 24, quantity: 1),
    CartItem(title: 'Mango', image: 'images/c2.png', price: 24, quantity: 1),
    CartItem(title: 'Mango', image: 'images/c3.png', price: 24, quantity: 1),
  ];

  RxList<CartItem> cartItems = RxList<CartItem>();

  @override
  void onInit() {
    cartItems.assignAll(_cartItems);
    super.onInit();
  }

  void addToCart(CartItem item) {
    bool itemExists = false;


    for (var cartItem in cartItems) {


      if (cartItem.title == item.title) {
        cartItem.incrementQuantity();
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      cartItems.add(item);
    }
    bool isFirstTime = !itemExists;
    isFirstTime? Fluttertoast.showToast(
      msg: "Item added to cart!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFF07CD6E),
      textColor: Colors.white,
    ):null;

    update(); // Notify listeners
  }

  void incrementQuantity(CartItem item) {
    item.incrementQuantity();
    update(); // Notify listeners
  }

  void decrementQuantity(CartItem item) {
    item.decrementQuantity();
    update(); // Notify listeners
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    update(); // Notify listeners
  }

  double calculateTotalPrice() {
    double totalAmount = 0;

    for (CartItem item in cartItems) {
      totalAmount += (item.price * item.quantity);
    }

    return totalAmount;
  }
}
