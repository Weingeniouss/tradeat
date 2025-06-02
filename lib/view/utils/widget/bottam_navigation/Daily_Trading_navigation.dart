
// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../screen/menu/my_channal/signal/signal.dart';
import '../../app_color.dart';
import '../../app_icon.dart';
import '../../app_string.dart';
import '../app_size.dart';
import '../horizontal_padding.dart';
import '../shadermask.dart';

class DailyTrading_navigation extends StatefulWidget {
  const DailyTrading_navigation({super.key});

  @override
  State<DailyTrading_navigation> createState() => _DailyTrading_navigationState();
}

class _DailyTrading_navigationState extends State<DailyTrading_navigation> {
  int selectindex = 0;

  List<Widget> selectedscreen = [
    Singnal(),
  ];

  Widget widgetselected(index) {
    return selectedscreen[index];
  }

  void channelindex() {
    setState(() {
      selectindex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColor.black_color),
        height: size.height / 8,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: size.height / 50),
            horizontalPadding(
              context: context,
              child: Container(
                height: size.height / 12, width: size.width,
                decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(size.width / 25), color: AppColor.textfield_color),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    //Signal
                    GestureDetector(
                      onTap: () => channelindex(),
                      child: Column(
                        children: [
                          (selectindex == 0)
                              ? Column(
                                  children: [
                                    Container(
                                      height: size.height / 180,
                                      width: size.width / 28,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColor.yellow_color,
                                              AppColor.orange_color,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          )),
                                    ),
                                    SizedBox(height: size.height / 80),
                                  ],
                                )
                              : SizedBox(height: size.height / 55),
                          SvgPicture.asset((selectindex == 0) ? AppIcon.Singnal_true : AppIcon.Signal_flase),
                          SizedBox(height: size.height / 150),
                          (selectindex == 0)
                              ? Shadermask(context: context, text: AppString.signal)
                              : Text(AppString.signal, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                        ],
                      ),
                    ),

                    //Watchlist
                    Column(
                      children: [
                        (selectindex == 1)
                            ? Column(
                                children: [
                                  Container(
                                    height: size.height / 180,
                                    width: size.width / 28,
                                    decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColor.yellow_color,
                                            AppColor.orange_color,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                  ),
                                  SizedBox(height: size.height / 80),
                                ],
                              )
                            : SizedBox(height: size.height / 55),
                        SvgPicture.asset(AppIcon.watchlist_false),
                        SizedBox(height: size.height / 150),
                        Text(AppString.Watchlist, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                      ],
                    ),

                    //chart
                    Column(
                      children: [
                        (selectindex == 2)
                            ? Column(
                                children: [
                                  Container(
                                    height: size.height / 180,
                                    width: size.width / 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColor.yellow_color,
                                            AppColor.orange_color,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                  ),
                                  SizedBox(height: size.height / 80),
                                ],
                              )
                            : SizedBox(height: size.height / 55),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcon.chart_false),
                            SizedBox(height: size.height / 150),
                            Text(AppString.Message, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                          ],
                        ),
                      ],
                    ),

                    //singnal
                    Column(
                      children: [
                        (selectindex == 3)
                            ? Column(
                                children: [
                                  Container(
                                    height: size.height / 180,
                                    width: size.width / 28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColor.yellow_color,
                                            AppColor.orange_color,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                  ),
                                  SizedBox(height: size.height / 80),
                                ],
                              )
                            : SizedBox(height: size.height / 55),
                        SvgPicture.asset(AppIcon.Account_flase),
                        SizedBox(height: size.height / 150),
                        Text(AppString.Members, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: widgetselected(selectindex),
    );
  }
}