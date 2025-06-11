// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/screen/menu/account/account.dart';
import 'package:tradeat/view/screen/menu/home/home.dart';
import 'package:tradeat/view/screen/menu/signal/signal.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../../controller/userInterface/creations/bloc/bottam_navigation/channale_navigation/channale_navigation.dart';
import '../../../../controller/userInterface/creations/event/bottam_navigation/channale_navigation/channle_navigation_Evant.dart';
import '../../../../controller/userInterface/creations/state/Bottam_navigation/channale_navigation/channale_navigation.dart';
import '../../../screen/menu/chat/chart.dart';
import '../../../screen/menu/my_channal/my_channel.dart';
import '../shadermask.dart';

class ChannaleNavigation extends StatelessWidget {
  ChannaleNavigation({super.key});

  List<Widget> selectedscreen = [
    MyChannel(),
    Chart(),
    Home(),
    Signal(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final changeTab = context.read<NavigationBloc>();
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (BuildContext context, state) {
        return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: AppColor.black_color),
          height: size.height * 0.13,
          child: Column(
            children: [
              SizedBox(height: size.height / 50),
              horizontalPadding(
                context: context,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    color: AppColor.textfield_color,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          //channel
                          iconsTupe(
                            onTap: () => changeTab.add(SelectNavigationTab(0)),
                            context: context,
                            indexs: state.selectedIndex == 0,
                            text: AppString.Channels,
                            trueicon: AppIcon.channel_true,
                            falseicon: AppIcon.channel_flase,
                          ),

                          //chart
                          iconsTupe(
                            onTap: () => changeTab.add(SelectNavigationTab(1)),
                            context: context,
                            indexs: state.selectedIndex == 1,
                            text: AppString.Chat,
                            trueicon: AppIcon.chart_true,
                            falseicon: AppIcon.chart_false,
                          ),

                          //home
                          iconsTupe(
                            onTap: () => changeTab.add(SelectNavigationTab(2)),
                            context: context,
                            indexs: state.selectedIndex == 2,
                            text: AppString.Home,
                            trueicon: AppIcon.home_true,
                            falseicon: AppIcon.home_false,
                          ),

                          //singnal
                          iconsTupe(
                            onTap: () => changeTab.add(SelectNavigationTab(3)),
                            context: context,
                            indexs: state.selectedIndex == 3,
                            text: AppString.Signal,
                            trueicon: AppIcon.signal,
                            falseicon: AppIcon.singal_false,
                          ),

                          //account
                          iconsTupe(
                            onTap: () => changeTab.add(SelectNavigationTab(4)),
                            context: context,
                            indexs: state.selectedIndex == 4,
                            text: AppString.Account,
                            trueicon: AppIcon.account_true,
                            falseicon: AppIcon.account_flase,
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: selectedscreen[state.selectedIndex]);
        },
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
