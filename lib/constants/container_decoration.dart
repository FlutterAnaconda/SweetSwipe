



import 'package:flutter/material.dart';

final decorationredbutton=BoxDecoration(
  shape: BoxShape.circle,
  gradient: const LinearGradient(
    colors: [
      Color(0xffDC626B),
      Color(0xffA6323A),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
      ),
  boxShadow: [
    BoxShadow(
      color: const Color(0xffE63946).withOpacity(0.30),
      blurRadius: 25,
      offset: const Offset(0,10),
      spreadRadius: 0,
    )
  ]
);

final decorationbackredbutton=BoxDecoration(
    shape: BoxShape.circle,
    gradient: const LinearGradient(
      colors: [
        Color(0xffDC626B),
        Color(0xffA6323A),
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ),
    boxShadow: [
      BoxShadow(
        color: const Color(0xffE63946).withOpacity(0.30),
        blurRadius: 25,
        offset: const Offset(0,10),
        spreadRadius: 0,
      )
    ]
);
final decorationsignin_B_15_Y_5=BoxDecoration(
  color: Colors.white,
borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: const Color(0xffE2CDC3).withOpacity(0.25),
        blurRadius: 15,
        offset: const Offset(0,5),
        spreadRadius: 0,
      )
    ]
);
final decorationcart_B_15_Y_5=BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(topRight: Radius.circular(55),topLeft: Radius.circular(55),),
    boxShadow: [
      BoxShadow(
        color: const Color(0xffA9AEB1).withOpacity(0.09),
        blurRadius: 20,
        offset: const Offset(0,8),
        spreadRadius: 0,
      )
    ]
);

