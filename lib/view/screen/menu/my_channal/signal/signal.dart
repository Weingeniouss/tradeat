// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/screen/menu/my_channal/signal/toggle/equity.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/loder.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';

import '../../../../utils/widget/shadermask.dart';

class Singnal extends StatelessWidget {
  const Singnal({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context, icons: AppIcon.left, text: AppString.DailyTradingTips),
      floatingActionButton: FutureBuilder(
        future: fetchChats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Padding(
            padding: EdgeInsets.all(size.width / 50),
            child: SpeedDial(
            icon: null, activeIcon: null,
            activeChild: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColor.yellow_color, AppColor.orange_color],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ),
              ),
              width: 56, height: 56, child: Icon(Icons.close,size: 33),
            ),
            overlayOpacity: 0.0,
            elevation: 8,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                backgroundColor: Colors.transparent,
                elevation: 0,
                labelWidget: Container(
                  padding:  EdgeInsets.symmetric(horizontal: size.width / 20, vertical: size.width / 20),
                  decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          debugPrint('Tapped Equity');
                          Navigator.of(context).pop();
                          await Future.delayed(Duration(milliseconds: 1));
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Equity()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppIcon.Equity),
                            SizedBox(width: 12),
                            Text('Equity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height / 50),
                      GestureDetector(
                        onTap: () => print('index'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           SvgPicture.asset(AppIcon.index),
                            SizedBox(width: 12),
                            Text('index', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height / 50),
                      GestureDetector(
                        onTap: () => print('F&O'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppIcon.F_O),
                            SizedBox(width: 12),
                            Text('F&O', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height / 50),
                      GestureDetector(
                        onTap: () => print('Hedg F&O'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           SvgPicture.asset(AppIcon.Hedg),
                            SizedBox(width: 12),
                            Text('Hedg F&O', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
             child: Container(
               decoration: BoxDecoration(
               shape: BoxShape.circle,
               gradient: LinearGradient(
                   colors: [AppColor.yellow_color, AppColor.orange_color],
                   begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                   width: 56, height: 56,
                   child: Icon(Icons.add,size: 33), // Closed icon
             )));
          }
          return SizedBox();
        },
      ),
      body: FutureBuilder(
        future: fetchChats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: LodingState(context),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              height: size.height, width: size.width,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: horizontalPadding(
                context: context,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileContainer(
                      context: context,
                      margin: EdgeInsets.symmetric(vertical: size.width / 50),
                      padding: EdgeInsets.all(20),
                      Widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width / 7, height: size.height / 25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.green_color),
                                  borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                ),
                                child: Center(child: Text('BUY', style: TextStyle(fontSize: size.width / 25, color: AppColor.green_color))),
                              ),
                              Text(AppString.DailyTradingTips, style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 31))
                            ],
                          ),
                          SizedBox(height: size.height / 100),
                          Shadermask(context: context, text: 'Maruti 27 Mar 11600 Call', fontSize: size.width / 25),
                          SizedBox(height: size.height / 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('₹11,000', style: TextStyle(color: AppColor.white_color, fontSize: size.width / 25,fontWeight: FontWeight.w500)),
                                  SizedBox(width: size.width / 80),
                                  Text('(2.64%)', style: TextStyle(color: AppColor.green_color, fontSize: size.width / 25,fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text('Return : 20%', style: TextStyle(fontSize: size.width / 25, color: AppColor.green_color,fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: size.height / 100),
                          Divider(color: AppColor.other_text_color),
                          SizedBox(height: size.height / 100),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Buying Price', style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 28)),
                                  SizedBox(height: size.height / 100),
                                  Text('₹11,000', style: TextStyle(fontSize: size.width / 30, color: AppColor.white_color,fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Buying Price', style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 28)),
                                  SizedBox(height: size.height / 100),
                                  Text('₹12,500', style: TextStyle(fontSize: size.width / 30, color: AppColor.white_color,fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Buying Price', style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 28)),
                                  SizedBox(height: size.height / 100),
                                  Text('₹10,500', style: TextStyle(fontSize: size.width / 30, color: AppColor.white_color,fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );},
                ),
              ),
            );
          }
          if(snapshot.hasError){
            return Scaffold(
              body: Container(
                height: size.height, width: size.width,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: Text('Sorry !',style: TextStyle(color: AppColor.white_color,fontSize: size.width / 25))),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
