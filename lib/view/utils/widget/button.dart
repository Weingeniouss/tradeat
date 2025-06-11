// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';

import '../app_color.dart';
import '../app_string.dart';
import '../responsive.dart';
import 'app_size.dart';

Widget Button({
  required BuildContext context,
  void Function()? onTap,
  bool? buttoncondition,
  String? buttonname
}) {
  final size = AppSize(context);
  final responsivetext = responsive_text(context);
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: (buttoncondition == true) ? LinearGradient(
            colors: [AppColor.yellow_color, AppColor.orange_color],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ) : null,
        color: AppColor.disable_button_color,
        borderRadius: BorderRadius.circular(size.width / 50),
      ),
      child: Center(
        child: Text(
          buttonname ?? AppString.Save,
          style: TextStyle(
            color: (buttoncondition == true)
                ? AppColor.button_text_color
                : AppColor.other_text_color,
            fontSize: responsivetext.value,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
