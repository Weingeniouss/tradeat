// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';

import '../../../screen/menu/my_channal/my_channel.dart';
import '../shadermask.dart';

class ChannaleNavigation extends StatefulWidget {
  const ChannaleNavigation({super.key});

  @override
  State<ChannaleNavigation> createState() => _ChannaleNavigationState();
}

class _ChannaleNavigationState extends State<ChannaleNavigation> {
  int selectindex = 0;

  List<Widget> selectedscreen = [
    MyChannel(),
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

                    //channel
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
                          SvgPicture.asset((selectindex == 0) ? AppIcon.channel_true : AppIcon.channel_flase),
                          SizedBox(height: size.height / 150),
                          (selectindex == 0)
                              ? Shadermask(context: context, text: AppString.Channels)
                              : Text(AppString.Channels, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                        ],
                      ),
                    ),

                    //chart
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
                        SvgPicture.asset(AppIcon.chart_false),
                        SizedBox(height: size.height / 150),
                        Text(AppString.Chat, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                      ],
                    ),

                    //home
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
                            SvgPicture.asset(AppIcon.home_false),
                            SizedBox(height: size.height / 150),
                            Text(AppString.Home, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
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
                        SvgPicture.asset(AppIcon.singal_false),
                        SizedBox(height: size.height / 150),
                        Text(AppString.Signal, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
                      ],
                    ),

                    //account
                    Column(
                      children: [
                        (selectindex == 4)
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
                        SvgPicture.asset(AppIcon.account_flase),
                        SizedBox(height: size.height / 150),
                        Text(AppString.Account, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
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
