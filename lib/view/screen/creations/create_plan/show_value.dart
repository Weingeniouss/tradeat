// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/controller/database/loacl_store/local.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/bottam_navigation/channale_navigation.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/button.dart';
import '../../../utils/widget/horizontal_padding.dart';
import '../../../utils/widget/profile_container.dart';

class ShowValue extends StatelessWidget {
  final String valuemark;

  const ShowValue({super.key, required this.valuemark});

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
            horizontalPadding(
              child: Button(
                onTap: () {
                  LocalDatabase().isLogins();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ChannaleNavigation();
                    }),
                  );
                },
                context: context,
                buttonname: AppString.Next,
                buttoncondition: true,
              ),
              context: context,
            )
          ],
        ),
      ),
      body: Container(
        width: size.width, height: size.height,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: horizontalPadding(
          context: context,
          child: Column(
            children: [
              SizedBox(height: size.height / 50),
              ProfileContainer(
                context: context,
                height: size.height / 6.5,
                Widget: horizontalPadding(
                  context: context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height / 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('30 Days',style: TextStyle(fontSize: size.width / 23,color: AppColor.white_color,fontWeight: FontWeight.w600)),
                          Row(
                            children: [
                              SvgPicture.asset(AppIcon.edit),
                              SizedBox(width: size.width / 40),
                              SvgPicture.asset(AppIcon.delet),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: size.height / 150),
                      Text(AppString.Free_trial,style: TextStyle(fontSize: size.width / 26,color: AppColor.other_text_color)),
                      SizedBox(height: size.height / 150),
                      Text(valuemark,style: TextStyle(fontSize: size.width / 20,color: AppColor.white_color,fontWeight: FontWeight.w600)),
                      SizedBox(height: size.height / 50),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: size.width / 3,
                      height: size.height / 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                          gradient: LinearGradient(colors: [
                        AppColor.yellow_color,
                        AppColor.orange_color,
                      ],begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Center(child: Text(AppString.addplan,style: TextStyle(fontWeight: FontWeight.w600,fontSize: size.width / 26))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
