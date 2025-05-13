// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import '../app_color.dart';
import 'app_size.dart';

Widget ProfileContainer({required BuildContext context,required Widget Widget}) {
  final size = AppSize(context);
  return Container(
    width: size.width, height: size.height / 1.34,
    decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
    child: Widget,
  );
}