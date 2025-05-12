import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';

class SetupProfile_frist extends StatelessWidget {
  const SetupProfile_frist({super.key});

  @override
  Widget build(BuildContext context) {
    final size =  AppSize(context);
    return Container(
      width: size.width, height: size.height,
      decoration: BoxDecoration(color: AppColor.black_color),
    );
  }
}
