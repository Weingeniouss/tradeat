// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';

import '../../../utils/widget/bottam_navigation/Daily_Trading_navigation.dart';
import '../../../utils/widget/shadermask.dart';

class MyChannel extends StatelessWidget {
  const MyChannel({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context,text: AppString.MyChannel,subtext: AppString.Create_Channel),
      body: Container(
        width: size.width, height: size.height,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: horizontalPadding(
          context: context,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DailyTrading_navigation()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: size.height / 100),
                  height: size.height / 5, width: size.width,
                  decoration: BoxDecoration(
                    color: AppColor.textfield_color,
                    borderRadius: BorderRadiusDirectional.circular(size.width / 25)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.width / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(AppString.DailyTradingTips,style: TextStyle(fontSize: size.width / 25,fontWeight: FontWeight.w600,color: AppColor.white_color)),
                        SizedBox(height: size.height / 100),
                        Text(AppString.subtextDailyTradingTips,style: TextStyle(fontSize: size.width / 30,color: AppColor.other_text_color)),
                        SizedBox(height: size.height / 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppString.win,style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 40)),
                                SizedBox(height: size.height / 150),
                                Text('58 %',style: TextStyle(color: AppColor.blue_color,fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppString.AVGRETURN,style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 40)),
                                SizedBox(height: size.height / 150),
                                Text('50 %',style: TextStyle(color: AppColor.green_color,fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppString.LIVESIGNAL,style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 40)),
                                SizedBox(height: size.height / 150),
                                Shadermask(context: context, text: '08',fontSize: size.width / 32)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
