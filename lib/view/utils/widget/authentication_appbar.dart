// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tradeat/view/utils/widget/bottam_navigation/channale_navigation.dart';
import 'package:tradeat/view/utils/widget/shadermask.dart';
import '../app_color.dart';
import '../app_icon.dart';
import '../app_string.dart';
import '../responsive.dart';
import 'app_size.dart';
import 'horizontal_padding.dart';

PreferredSizeWidget authenticationAppBar({required BuildContext context,required double progress}) {
  final size = AppSize(context);
  double appbarsize =  size.height / 5;
  final headingSize = heading(context);
  final subheadingSize = subheading(context);
  final responsivetext = responsive_text(context);

  ValueNotifier<double> progressNotifier = ValueNotifier<double>(progress);

  return PreferredSize(
    preferredSize: Size.fromHeight(appbarsize),
    child: Container(
      height: appbarsize, width: size.width,
      decoration: BoxDecoration(color: AppColor.black_color),
      child: SafeArea(
        child: horizontalPadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height / 80),
              GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.left)),
              SizedBox(height: size.height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.Setup, style: TextStyle(color: AppColor.white_color, fontSize: headingSize.value)),
                      SizedBox(height: size.height / 50),
                      Text(AppString.subhedingSetup, style: TextStyle(color: AppColor.gray_color, fontSize: subheadingSize.value)),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 35, lineWidth: 5,
                    percent: progressNotifier.value / 100,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true, animationDuration: 2,
                    backgroundColor: AppColor.gray_color,
                    linearGradient: LinearGradient(
                      colors: [
                        AppColor.yellow_color, AppColor.orange_color,
                      ],
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    ),
                    center: Text("${progressNotifier.value.toInt()}%", style: TextStyle(fontSize: responsivetext.value, fontWeight: FontWeight.w700, color: AppColor.white_color)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget authenticationprice({required BuildContext context}) {
  final size = AppSize(context);
  double appbarsize =  size.height / 4;
  final headingSize = heading(context);
  final subheadingSize = subheading(context);
  final responsivetext = responsive_text(context);

  return PreferredSize(
    preferredSize: Size.fromHeight(appbarsize),
    child: Container(
      height: appbarsize, width: size.width,
      decoration: BoxDecoration(color: AppColor.black_color),
      child: SafeArea(
        child: horizontalPadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height / 80),
              GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.left)),
              SizedBox(height: size.height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.pricing_Plan, style: TextStyle(color: AppColor.white_color, fontSize: headingSize.value)),
                      SizedBox(height: size.height / 50),
                      SizedBox(width: size.width / 1.4 ,child: Text(AppString.pricing_Plan_sub_hed, style: TextStyle(color: AppColor.gray_color, fontSize: subheadingSize.value))),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget authenticationChannel({required BuildContext context}) {
  final size = AppSize(context);
  double appbarsize =  size.height / 3.6;
  final headingSize = heading(context);
  final subheadingSize = subheading(context);
  final responsivetext = responsive_text(context);
  return PreferredSize(
    preferredSize: Size.fromHeight(appbarsize),
    child: Container(
      height: appbarsize, width: size.width,
      decoration: BoxDecoration(color: AppColor.black_color),
      child: SafeArea(
        child: horizontalPadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height / 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.left)),
                   GestureDetector(
                     onTap: () {
                       Get.offAll(() => ChannaleNavigation());
                     },
                     child: Container(
                      width: size.width / 6, height: size.height / 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.yellow_color, AppColor.orange_color,
                          ],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        ),
                      ),
                       child: Center(child: Text(AppString.skip,style: TextStyle(fontWeight: FontWeight.w700))),
                     ),
                   ),
                ],
              ),
              SizedBox(height: size.height / 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.Create, style: TextStyle(color: AppColor.white_color, fontSize: headingSize.value)),
                  SizedBox(height: size.height / 50),
                  SizedBox(width: size.width / 1.4 ,child: Text(AppString.subCreate, style: TextStyle(color: AppColor.gray_color, fontSize: subheadingSize.value))),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget simpaleaapbar(context,{String? text, String? subtext, String? icons}){
  final size = AppSize(context);
  return AppBar(
    elevation: 0,
    backgroundColor: AppColor.black_color,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (text != null) ? Row(
            children: [
              (icons != null) ? GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(icons)) : SizedBox(),
              (icons != null) ? SizedBox(width: size.width / 30) :  SizedBox(),
              Text(text,style: TextStyle(fontSize: size.width / 23,fontWeight: FontWeight.w600,color: AppColor.white_color)),
            ],
          ) : GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.left)),
          (subtext != null) ? Shadermask(context: context, text: subtext,fontSize: size.width / 25) : SizedBox(),
        ],
      ),
    ),
    automaticallyImplyLeading: false,
  );
}