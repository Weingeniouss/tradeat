
// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradeat/view/screen/menu/my_channal/watchlist/watchlist.dart';
import '../../../../controller/userInterface/creations/bloc/bottam_navigation/channale_navigation/channale_navigation.dart';
import '../../../../controller/userInterface/creations/event/bottam_navigation/channale_navigation/channle_navigation_Evant.dart';
import '../../../../controller/userInterface/creations/state/Bottam_navigation/channale_navigation/channale_navigation.dart';
import '../../../screen/menu/my_channal/membars/membars.dart';
import '../../../screen/menu/my_channal/message/message_chat.dart';
import '../../../screen/menu/my_channal/signal/signal.dart';
import '../../app_color.dart';
import '../../app_icon.dart';
import '../../app_string.dart';
import '../app_size.dart';
import '../horizontal_padding.dart';
import '../shadermask.dart';

class DailyTrading_navigation extends StatelessWidget {
  DailyTrading_navigation({super.key});

  List<Widget> selectedscreen = [
    Singnal(),
    Watchlist(),
    MessageChat(),
    Membars(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) => previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        int selectedIndex = state.selectedIndex;
        final select = context.read<NavigationBloc>();
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

                          //Signal
                          iconsTupe(
                            onTap: () => select.add(SelectNavigationTab(0)),
                            context: context,
                            indexs: selectedIndex == 0,
                            text: AppString.signal,
                            trueicon: AppIcon.Singnal_true,
                            falseicon: AppIcon.Signal_flase,
                          ),

                          //Watchlist
                          iconsTupe(
                            onTap: () => select.add(SelectNavigationTab(1)),
                            context: context,
                            indexs: selectedIndex == 1,
                            text: AppString.Watchlist,
                            trueicon: AppIcon.watchlist,
                            falseicon: AppIcon.watchlist_false,
                          ),

                          //chart
                          iconsTupe(
                            onTap: () => select.add(SelectNavigationTab(2)),
                            context: context,
                            indexs: selectedIndex == 2,
                            text: AppString.Message,
                            trueicon: AppIcon.chart_true,
                            falseicon: AppIcon.chart_false,
                          ),

                          //singnal
                          iconsTupe(
                            onTap: () => select.add(SelectNavigationTab(3)),
                            context: context,
                            indexs: selectedIndex == 3,
                            text: AppString.Members,
                            trueicon: AppIcon.account_true,
                            falseicon: AppIcon.Account_flase,
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
        body: selectedscreen[state.selectedIndex],
      );
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
              : Text(
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