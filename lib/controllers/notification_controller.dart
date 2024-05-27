
import 'package:get/get.dart';
import 'package:sweet_swipe/models/productmodel.dart';




class Notificationcontroller extends GetxController {

List<ProductModel> noti = [

  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: false),
  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: false),
  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: false),
  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: false),
  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: false),
  ProductModel(title: '1',isfav: true),
  ProductModel(title: '1',isfav: false),
];

RxList<ProductModel> notification = <ProductModel>[].obs;

@override
void onInit() {
  // Copy the contents of noti list to the notification list
  notification.assignAll(noti);
  print(notification.length);
  super.onInit();
}
void deletenoti(int index) {
  print('I am Called');
  print('index====================$index');

  if (index >= 0 && index < notification.length) {
    notification.removeAt(index);
  }

  print('index====================$index');
  print(notification.length);
}



}
