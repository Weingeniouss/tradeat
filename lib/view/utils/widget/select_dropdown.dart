// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_color.dart';
import '../app_icon.dart';
import '../app_string.dart';
import '../responsive.dart';
import 'app_size.dart';

Widget selectdDropdown({
  void Function(String)? onChanged,
  TextEditingController? controller,
  required String heding,
  Color? Stringcolor,
  required BuildContext context,
  required String text, required Widget? child,
  required String hinttext,
}) {
  final size = AppSize(context);
  final responsivetext = responsive_text(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(heding,style: TextStyle(color: AppColor.other_text_color,fontSize: responsivetext.value)),
      SizedBox(height: size.height / 160),
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  elevation: 0,
                  backgroundColor: AppColor.textfield_color,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(hinttext, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 22)),
                      GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.cancel)),
                    ],
                  ),
                  content: Container(
                    width: size.width, height: size.height / 1.7,
                    decoration: BoxDecoration(color: AppColor.textfield_color),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                                  hintText: AppString.Search,
                                  hintStyle: TextStyle(color: AppColor.gray_color),
                                  suffixIcon: Icon(Icons.search, color: AppColor.gray_color),
                                ),
                                style: TextStyle(color: AppColor.white_color), cursorColor: AppColor.white_color,
                                onChanged: onChanged,
                                controller: controller,
                              ),
                            ),
                            height: size.height / 16, width: size.width,
                          ),
                          SizedBox(height: size.height / 50),
                          SizedBox(child: child, height: size.height / 1.5),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Column(
          children: [
            Container(
              height: size.height / 16.5, width: size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.width / 30), border: Border.all(color: AppColor.textfield_color_2)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: TextStyle(color: Stringcolor)),
                    SvgPicture.asset(AppIcon.down),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height / 50),
          ],
        ),
      ),
      SizedBox(height: size.height / 160),
    ],
  );
}