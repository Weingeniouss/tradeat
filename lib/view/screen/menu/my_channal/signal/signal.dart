// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
      appBar: simpaleaapbar(context,
          icons: AppIcon.left, text: AppString.DailyTradingTips),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(size.width / 50),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColor.yellow_color, AppColor.orange_color], // Your gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.add,size: 32), // Example child
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: Center(
          child: Image.asset(AppIcon.noData,fit: BoxFit.cover,scale: 4,),
        ),
      ),
    );
  }
}
