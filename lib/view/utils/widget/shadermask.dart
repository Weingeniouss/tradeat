// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';


Widget Shadermask({required BuildContext context, required String text, double? fontSize}) {
  final size = AppSize(context);
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [
          AppColor.yellow_color,
          AppColor.orange_color,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds);
    },
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: fontSize ?? size.width / 35,
      ),
    ),
  );
}
