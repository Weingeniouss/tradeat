// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import '../app_color.dart';
import 'app_size.dart';

Widget ProfileContainer({
  required BuildContext context,
  required Widget Widget,
  double? height,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
}) {
  final size = AppSize(context);
  return Container(
    padding: padding ?? EdgeInsets.all(30),
    margin: margin,
    decoration: BoxDecoration(
      color: AppColor.textfield_color,
      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
    ),
    child: Widget,
  );
}

Widget AnimatedContainers({
  required BuildContext context,
  required Widget child,EdgeInsetsGeometry? padding,
}){
  final size = AppSize(context);
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
     constraints: BoxConstraints(),
     padding: padding ?? EdgeInsets.all(20),
     decoration: BoxDecoration(
       color: AppColor.textfield_color,
       borderRadius: BorderRadius.circular(size.width / 25),
     ),
    child: child,
  );
}
