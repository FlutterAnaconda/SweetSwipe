import 'dart:math';

import 'package:flutter/material.dart';



class RandomColor {
  Color getRandomLightColor() {
    Random random = Random();

    // Generate random values for red, green, and blue channels with lower values
    int red = random.nextInt(76) + 180; // 180-255
    int green = random.nextInt(76) + 180; // 180-255
    int blue = random.nextInt(76) + 180;




    // Create a Color object with the generated RGB values
    Color randomColor = Color.fromRGBO(red, green, blue, 1.0);

    return randomColor;
  }

}
