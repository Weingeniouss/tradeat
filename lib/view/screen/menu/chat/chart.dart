import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      body: Container(
        height: size.height, width: size.width,
        decoration: BoxDecoration(color: AppColor.black_color),
      ),
    );
  }
}
