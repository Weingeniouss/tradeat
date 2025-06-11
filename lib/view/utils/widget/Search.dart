// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import '../app_color.dart';
import '../app_icon.dart';
import '../app_string.dart';

Widget searchBar({
  required BuildContext context,
  required TextEditingController controller,
  void Function(String)? onChanged,
}) {
  final size = AppSize(context);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
      color: AppColor.textfield_color,
    ),
    child: TextField(
      controller: controller, onChanged: onChanged,
      cursorColor: AppColor.white_color,
      style: TextStyle(color: AppColor.white_color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        hintText: AppString.SearchMembers,
        hintStyle: TextStyle(color: AppColor.other_text_color),
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(AppIcon.search, fit: BoxFit.cover),
        ),
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ),
  );
}
