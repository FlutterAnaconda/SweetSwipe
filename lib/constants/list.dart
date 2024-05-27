

import 'package:flutter/Material.dart';
import 'package:sweet_swipe/views/main_app/home_screen/bottom_tabs/favorite_tab/Favorite_screen.dart';

import '../models/productmodel.dart';
import '../models/profile_tab_model.dart';
import '../views/main_app/home_screen/notification_screen.dart';

final List<ProductModel> hometoplist=[
  ProductModel(title: 'All',),
  ProductModel(title: 'Donuts',image: 'd1'),
  ProductModel(title: 'Brownies',image: 'd2'),
  ProductModel(title: 'Cakes',image: 'd3'),
  ProductModel(title: 'Donuts',image: 'd1'),
  ProductModel(title: 'Brownies',image: 'd2'),
  ProductModel(title: 'Cakes',image: 'd3'),

];
final List<ProductModel> checkout=[
  ProductModel(title: 'Home',image: 'images/home.png'),
  ProductModel(title: 'Office',image: 'images/office.png'),

];
final List<ProfiletabModel> profiletablist = [
  ProfiletabModel(
      iconspath: 'p1',
      onpressed: (context) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => NotificationScreen()),
            ));
      },
      title: 'My Profile'),
  ProfiletabModel(
      iconspath: 'p2',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => NotificationScreen()),
          ),
        );
      },
      title: 'My Barkery'),

  ProfiletabModel(
      iconspath: 'p3',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) =>  NotificationScreen(
              // answer: [
              //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
              // ],
              // appbartitle: 'Privacy Policy',
              // height: 500,
              // numberofQAs: 1,
              // question: ['You need to fulfil these requirements'],
            )),
          ),
        );
      },
      title: 'Notification'),

  ProfiletabModel(
    iconspath: 'p4',
    onpressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => NotificationScreen(
            // answer: [
            //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
            // ],
            // appbartitle: 'Privacy Policy',
            // height: 500,
            // numberofQAs: 1,
            // question: ['You need to fulfil these requirements'],
          )),
        ),
      );
    },
    title: 'About Us',
  ),
  ProfiletabModel(
    iconspath: 'p5',
    onpressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) =>  NotificationScreen()),
        ),
      );
    },
    title: 'Privacy Policy',
  ),
  ProfiletabModel(
    iconspath: 'p6',
    onpressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => FavoriteScreen()),
        ),
      );
    },
    title: 'My Favorite',
  ),
  ProfiletabModel(
    iconspath: 'p7',
    onpressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => NotificationScreen(
            // answer: [
            //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
            // ],
            // appbartitle: 'Refund Policy',
            // height: 500,
            // numberofQAs: 1,
            // question: ['You need to fulfil these requirements'],
          )),
        ),
      );
    },
    title: 'FAQs',
  ),


  // Add more items as needed
];
final List<ProductModel> notimsg=[
  ProductModel(title: 'Transaction Success',subtitle: 'We have successfully received your payment\nfor the tale of albantara.'),
  ProductModel(title: 'Payment Failed',subtitle: 'We cannot procceed your transaction now.\nplease try again later.'),

];

final List<ProductModel> paymentcheckout=[
  ProductModel(title: 'Master Card',image: 'images/master.png'),
  ProductModel(title: 'PayPal',image: 'images/paypal.png'),
  ProductModel(title: 'Cash On Delivery',image: 'images/cod.png'),

];

final List<ProductModel> checkoutedit=[
  ProductModel(title: 'fawadh747@gmail.com',subtitle: 'Email',image: 'images/sms.png'),
  ProductModel(title: '(+92) 1213145',subtitle: 'Phone',image: 'images/call.png'),

];
