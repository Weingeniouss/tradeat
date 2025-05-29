// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import '../app_color.dart';
import '../app_icon.dart';

Widget swichs({required bool isToggled}){
  return AnimatedContainer(
    duration: Duration(milliseconds: 300), width: 60, height: 30,
    padding: EdgeInsets.symmetric(horizontal: 7),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: AssetImage((isToggled) ? AppIcon.swich_true :AppIcon.swich), fit: BoxFit.cover)),
    alignment: isToggled ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isToggled) ? AppColor.white_color : null,
        gradient: (isToggled) ?  null : LinearGradient(
          colors: [
            AppColor.yellow_color, AppColor.orange_color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
  );
}