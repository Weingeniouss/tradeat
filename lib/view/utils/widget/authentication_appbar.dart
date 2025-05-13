// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
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


// Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     SizedBox(
                  //       width: 70,
                  //       height: 70,
                  //       child: SimpleCircularProgressBar(
                  //         progressColors: [
                  //           AppColor.yellow_color,
                  //           AppColor.orange_color
                  //         ],
                  //         backColor: AppColor.gray_color,
                  //         progressStrokeWidth: 7,
                  //         backStrokeWidth: 7,
                  //         mergeMode: true,
                  //         animationDuration: 3,
                  //         valueNotifier: progressNotifier,
                  //       ),
                  //     ),
                  //     ValueListenableBuilder<double>(
                  //       valueListenable: progressNotifier,
                  //       builder: (context, value, _) {
                  //         return Text(
                  //           "${value.toInt()}%",
                  //           style: TextStyle(fontSize: responsivetext.value, fontWeight: FontWeight.w700, color: AppColor.white_color),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),