// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';

class Singnal extends StatelessWidget {
  const Singnal({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context, icons: AppIcon.left, text: AppString.DailyTradingTips),
      floatingActionButton: Padding(
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
                      onTap: () => print('Equity'),
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
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
              ),
            ),
            width: 56, height: 56,
            child: Icon(Icons.add,size: 33), // Closed icon
          ),
        ),
      ),
      body: Container(
        height: size.height, width: size.width,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: Center(child: Image.asset(AppIcon.noData, fit: BoxFit.cover, scale: 4)),
      ),
    );
  }
}
