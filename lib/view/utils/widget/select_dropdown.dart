// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_color.dart';
import '../app_icon.dart';
import '../responsive.dart';
import 'app_size.dart';

Widget SelectedDropdown({
  required void Function()? onTap,
  required BuildContext context,
  required String text,
  required bool condition,
  required String heding,
}) {
 final size = AppSize(context);
  final responsivetext = responsive_text(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(heding, style: TextStyle(color: AppColor.other_text_color, fontSize: responsivetext.value)),
      SizedBox(height: size.height / 80),
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height / 16.5, width: size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.width / 30), border: Border.all(color: AppColor.textfield_color_2)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: TextStyle(color: (condition) ? AppColor.white_color : AppColor.gray_color)),
                SvgPicture.asset(AppIcon.down, color: AppColor.gray_color),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: size.height / 50),
    ],
  );
}