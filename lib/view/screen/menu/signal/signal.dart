// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/loder.dart';

import '../../../utils/app_string.dart';
import '../../../utils/widget/shadermask.dart';

class Signal extends StatefulWidget {
  const Signal({super.key});

  @override
  State<Signal> createState() => _SignalState();
}

class _SignalState extends State<Signal> {
  late Future<void> loadFuture;

  Future<void> loadingState(BuildContext context) async {
   await Future.delayed(Duration(seconds: 1));
  }

   Future<void> refresh() async {
    setState(() {
      loadFuture = loadingState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context, text: AppString.Signals),
      body: FutureBuilder(
        future: fetchChats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                width: size.width, height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: LodingState(context)),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () => refresh(),
              child: Container(
                width: size.width, height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: horizontalPadding(
                  context: context,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: size.width / 50),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColor.textfield_color,
                          borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width / 7,
                                  height: size.height / 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.green_color),
                                    borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                  ),
                                  child: Center(child: Text('BUY', style: TextStyle(fontSize: size.width / 25, color: AppColor.green_color))),
                                ),
                                Text(AppString.DailyTradingTips, style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 31))
                              ],
                            ),
                            SizedBox(height: size.height / 100),
                            Shadermask(context: context, text: 'Maruti 27 Mar 11600 Call', fontSize: size.width / 25),
                            SizedBox(height: size.height / 100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('₹11,000', style: TextStyle(color: AppColor.white_color, fontSize: size.width / 25,fontWeight: FontWeight.w500)),
                                    SizedBox(width: size.width / 80),
                                    Text('(2.64%)', style: TextStyle(color: AppColor.green_color, fontSize: size.width / 25,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                Text('Return : 20%', style: TextStyle(fontSize: size.width / 25, color: AppColor.green_color,fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(height: size.height / 100),
                            Divider(color: AppColor.other_text_color),
                            SizedBox(height: size.height / 100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Buying Price', style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 28)),
                                    SizedBox(height: size.height / 100),
                                    Text('₹11,000', style: TextStyle(fontSize: size.width / 30, color: AppColor.white_color,fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Buying Price', style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 28)),
                                    SizedBox(height: size.height / 100),
                                    Text('₹12,500', style: TextStyle(fontSize: size.width / 30, color: AppColor.white_color,fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Buying Price', style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 28)),
                                    SizedBox(height: size.height / 100),
                                    Text('₹10,500', style: TextStyle(fontSize: size.width / 30, color: AppColor.white_color,fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Container(
                width: size.width, height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: Text('Sorry !', style: TextStyle(color: AppColor.white_color))),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
