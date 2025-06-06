// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/screen/menu/account/account.dart';
import 'package:tradeat/view/screen/menu/home/home.dart';
import 'package:tradeat/view/screen/menu/signal/signal.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../screen/menu/chat/chart.dart';
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
    Chart(),
    Home(),
    Signal(),
    Account(),
  ];

  Widget widgetselected(index) {
    return selectedscreen[index];
  }

  void channelindex() {
    setState(() => selectindex = 0);
  }

  void chatindex(){
    setState(() => selectindex = 1);
  }

  void homeindex(){
    setState(() => selectindex = 2);
  }

  void signalindex(){
    setState(() => selectindex = 3);
  }

  void accountindex(){
    setState(() => selectindex = 4);
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                  color: AppColor.textfield_color,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      //channel
                      iconsTupe(
                        onTap: () => channelindex(),
                        context: context,
                        indexs: selectindex == 0,
                        text: AppString.Channels,
                        trueicon: AppIcon.channel_true,
                        falseicon: AppIcon.channel_flase,
                      ),

                      //chart
                      iconsTupe(
                        onTap: () => chatindex(),
                        context: context,
                        indexs: selectindex == 1,
                        text: AppString.Chat,
                        trueicon: AppIcon.chart_true,
                        falseicon: AppIcon.chart_false,
                      ),

                      //home
                      iconsTupe(
                        onTap: () => homeindex(),
                        context: context,
                        indexs: selectindex == 2,
                        text: AppString.Home,
                        trueicon: AppIcon.home_true,
                        falseicon: AppIcon.home_false,
                      ),

                      //singnal
                      iconsTupe(
                        onTap: () => signalindex(),
                        context: context,
                        indexs: selectindex == 3,
                        text: AppString.Signal,
                        trueicon: AppIcon.signal,
                        falseicon: AppIcon.singal_false,
                      ),

                      //account
                      iconsTupe(
                        onTap: () => accountindex(),
                        context: context,
                        indexs: selectindex == 4,
                        text: AppString.Account,
                        trueicon: AppIcon.account_true,
                        falseicon: AppIcon.account_flase,
                      ),
                    ],
                  ),
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

Widget iconsTupe({
  required BuildContext context,
  required bool indexs,
  required String text,
  required String trueicon,
  required String falseicon,
  void Function()? onTap,
}) {
  final size = AppSize(context);
  return SizedBox(
    width: size.width / 7,
    child: GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          (indexs) ? SizedBox(
            height: size.height / 55,
            child: (indexs) ? Column(
              children: [
                Container(
                  height: size.height / 180, width: size.width / 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    gradient: LinearGradient(
                      colors: [
                        AppColor.yellow_color,
                        AppColor.orange_color
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                SizedBox(height: size.height / 80),
              ],
            ) : SizedBox.shrink(),
          ) : SizedBox(height: size.height / 55),
          SvgPicture.asset((indexs) ? trueicon : falseicon),
          SizedBox(height: size.height / 150),
          (indexs) ? Shadermask(context: context, text: text) : Text(
            text,
            style: TextStyle(
              color: AppColor.other_text_color,
              fontWeight: FontWeight.w600,
              fontSize: size.width / 35,
            ),
          ),
        ],
      ),
    ),
  );
}
