// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';

//Font size
ResponsiveValue<double> heading(BuildContext context) {
  final size = AppSize(context);

  return ResponsiveValue<double>(
    context,
    defaultValue: size.width / 18,
    conditionalValues: [
      Condition.smallerThan(name: 'Mobile', value: size.width / 50),
      Condition.largerThan(name: 'Small Tablet', value: size.width / 25,landscapeValue:  size.width / 40),
    ],
  );
}

ResponsiveValue<double> subheading(BuildContext context) {
  final size = AppSize(context);

  return ResponsiveValue<double>(
    context,
    defaultValue: size.width / 30,
    conditionalValues: [
      Condition.smallerThan(name: 'Mobile', value: size.width / 32),
      Condition.largerThan(name: 'Small Tablet', value: size.width / 45,landscapeValue:  size.width / 65),
    ],
  );
}

ResponsiveValue<double> responsive_text(BuildContext context) {
  final size = AppSize(context);

  return ResponsiveValue<double>(
    context,
    defaultValue: size.width / 28,
    conditionalValues: [
      Condition.smallerThan(name: 'Mobile', value: size.width / 50),
      Condition.largerThan(name: 'Small Tablet', value: size.width / 41,landscapeValue:  size.width / 80),
    ],
  );
}


// double wp(BuildContext context, double percentage) {
//   return MediaQuery.of(context).size.width * (percentage / 100);
// }
//
// double hp(BuildContext context, double percentage) {
//   return MediaQuery.of(context).size.height * (percentage / 100);
// }
// Container(
//   width: wp(context, 50),  // 50% of screen width
//   height: hp(context, 20), // 20% of screen height
//   color: Colors.blue,
// );