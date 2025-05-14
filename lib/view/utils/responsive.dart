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


double wp({required BuildContext context, required double percentage}) {
  return MediaQuery.of(context).size.width * (percentage / 100);
}

double hp({required BuildContext context, required double percentage}) {
  return MediaQuery.of(context).size.height * (percentage / 100);
}


class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? microMobile;
  final Widget? tabletVertical;
  final Widget? tabletHorizontal;
  final Widget? desktop;

  const ResponsiveWidget({super.key, required this.mobile, this.microMobile, this.tabletVertical, this.tabletHorizontal, this.desktop,});

  static bool isMicroMobile(BuildContext context) => MediaQuery.of(context).size.width >= 320;
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width > 420 && MediaQuery.of(context).size.width < 768;
  static bool isTabletVertical(BuildContext context) => MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 1024;
  static bool isTabletHorizontal(BuildContext context) => MediaQuery.of(context).size.width >= 1024 && MediaQuery.of(context).size.width < 1440;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1440;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context) && desktop != null) {return desktop!;}
    else if (isTabletHorizontal(context) && tabletHorizontal != null) {return tabletHorizontal!;}
    else if (isTabletVertical(context) && tabletVertical != null) {return tabletVertical!;}
    else if (isMicroMobile(context) && microMobile != null) {return microMobile!;}
    else {return mobile;}
  }
}