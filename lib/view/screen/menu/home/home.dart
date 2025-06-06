
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/loder.dart';
import '../../../utils/app_icon.dart';
import '../../../utils/app_string.dart';
import '../../../utils/widget/authentication_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context,text: AppString.Dashboard),
      body: FutureBuilder(
        future: fetchChats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              body: Container(
                width: size.width, height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: LodingState(context)),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
               width: size.width, height: size.height,
               decoration: BoxDecoration(color: AppColor.black_color),
               child: Center(child: Image.asset(AppIcon.noData, fit: BoxFit.cover, scale: 4)),
             );
          }
          if(snapshot.hasError){
            return Container(
              width: size.width, height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: Center(child: Image.asset(AppIcon.noData, fit: BoxFit.cover, scale: 4)),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
