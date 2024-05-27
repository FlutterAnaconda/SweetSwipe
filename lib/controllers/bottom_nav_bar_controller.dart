

import 'package:get/get.dart';

class Bottomnavbarcontroller extends GetxController{
  Rx<int> currentindex =0.obs;

   void resetindex(){

     currentindex.value =0;
   }

}