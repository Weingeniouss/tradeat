// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import '../app_color.dart';
import '../app_gif.dart';
import '../app_string.dart';
import '../responsive.dart';

 Future fetchChats() async {
    await Future.delayed(Duration(milliseconds: 800));
  }

Widget LodingState(context){
  final size =  AppSize(context);
  final responsivetext = responsive_text(context);
  return Center(
    child: Container(
      height: size.height / 15, width: size.width / 2,
      decoration: BoxDecoration(color: AppColor.white_color,borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(AppGif.loader),
            SizedBox(width: size.width / 40),
            Text(AppString.Please_Wait, style: TextStyle(fontSize: responsivetext.value, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    ),
  );
}