
// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../screen/menu/my_channal/message/message_chat.dart';
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
    MessageChat(),
  ];

  Widget widgetselected(index) {
    return selectedscreen[index];
  }

  void channelindex() {
    setState(() {
      selectindex = 0;
    });
  }

  void messageindex(){
    setState(() {
      selectindex = 1;
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
                    iconsTupe(onTap: () => channelindex(),context: context, indexs: selectindex == 0, text: AppString.signal, trueicon: AppIcon.Singnal_true, falseicon: AppIcon.Signal_flase),

                    //Watchlist
                    iconsTupe(context: context, indexs: selectindex == 2, text: AppString.Watchlist, trueicon: AppIcon.watchlist_false, falseicon: AppIcon.watchlist_false),

                    //chart
                    iconsTupe(onTap: () => messageindex(),context: context, indexs: selectindex == 1, text: AppString.Message, trueicon: AppIcon.chart_true, falseicon: AppIcon.chart_false),

                    //singnal
                    iconsTupe(context: context, indexs: selectindex == 3, text: AppString.Members, trueicon: AppIcon.Account_flase, falseicon: AppIcon.Account_flase),
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
    width: size.width / 6.8,
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
          (indexs)
              ? Shadermask(context: context, text: text)
              : Text(text, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w600, fontSize: size.width / 35)),
        ],
      ),
    ),
  );
}