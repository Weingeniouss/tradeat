import 'package:flutter/cupertino.dart';

import 'app_size.dart';

Widget horizontalPadding({BuildContext? context, required Widget child}) {
  final size = AppSize(context!);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width / 15),
    child: child,
  );
}