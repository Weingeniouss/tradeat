import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/button.dart';
import '../../../utils/widget/horizontal_padding.dart';

class ShowValue extends StatelessWidget {
  const ShowValue({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context),
      bottomNavigationBar: Container(
          height: size.height / 10,
          color: AppColor.black_color,
            child: Column(
              children: [
                 horizontalPadding(child: Button(context: context,),context: context)
              ],
            ),
        ),
      body: Container(
        width: size.width, height: size.height,
        decoration: BoxDecoration(color: AppColor.black_color),
      ),
    );
  }
}
