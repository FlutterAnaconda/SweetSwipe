import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweet_swipe/constants/colors.dart';
import 'package:sweet_swipe/constants/list.dart';
import 'package:sweet_swipe/controllers/notification_controller.dart';
import 'package:sweet_swipe/widgets/buttons/backbutton.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Notificationcontroller noti = Get.find<Notificationcontroller>();
@override
  void initState() {
    noti.onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    MyBackbutton(
                      ontap: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Notification',
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff022C41),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 0.3,
                  color: Color(0xffD2D2D2),
                ),
              ),
              Obx(() {
                if (noti.notification.isEmpty) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 58.0),
                child: Image.asset(
                'images/nonoti.png',
                height: 469,
                width: MediaQuery.of(context).size.width <= 390
                ? MediaQuery.of(context).size.width * 0.7
                    : MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
                ),);
                } else {
                return const SizedBox(height: 25);
                }
              }
              ),
              if (noti.notification.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: noti.notification.length,
                  itemBuilder: (context, index) {
                    int notimsgindex = noti.notification[index].isfav ? 0 : 1;
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xffD3D1D8).withOpacity(0.21),
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
                        noti.deletenoti(index);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 89,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 15,
                              spreadRadius: 0,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            Image.asset(
                              'images/bell.png',
                              height: 34,
                              width: 34,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.69,
                                  child: Row(
                                    children: [
                                      Text(
                                        notimsg[notimsgindex].title!,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff0D0140),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '5 min ago',
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffDC626B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  notimsg[notimsgindex].subtitle!,
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff929292),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

            ],
          ),
        ),
      ),
    );
  }
}
