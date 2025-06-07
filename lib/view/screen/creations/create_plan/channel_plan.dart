// ignore_for_file: unused_import, non_constant_identifier_names, avoid_print, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tradeat/controller/database/loacl_store/local.dart';
import 'package:tradeat/modal/days.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_contrast.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';
import 'package:tradeat/view/utils/widget/button.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/inputfield.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';
import 'package:tradeat/view/utils/widget/swich.dart';
import '../../../../../view/screen/creations/create_plan/show_value.dart';
import '../../../../../view/utils/widget/select_dropdown.dart';
import '../../../../controller/userInterface/creations/bloc/create_plan/channel_plan_bloc.dart';
import '../../../../controller/userInterface/creations/state/create_plan/channel_plan_state.dart';

class ChannelPlan extends StatelessWidget {
  ChannelPlan({super.key});

  TextEditingController planAmountController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.isEmpty) return newValue.copyWith(text: '');

    String formatted = currencyFormat.format(int.parse(newText));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final channal =  context.read<DurationCubit>();
    return BlocBuilder<DurationCubit, DurationState>(
      builder: (BuildContext context, state) {
        return Scaffold(
        appBar: simpaleaapbar(context),
        bottomNavigationBar: Container(
          height: size.height / 10, width: size.width,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: Column(
            children: [
              Center(
                child: horizontalPadding(
                  context: context,
                  child: Button(
                    onTap: (){
                      if(planAmountController.text.isNotEmpty && offerPriceController.text.isNotEmpty && state.selectedDuration != null && state.selectedDuration!.isNotEmpty) {
                        LocalDatabase().channalePlan(planAmountController, offerPriceController,selectedDuration: state.selectedDuration,selectedDurationSecond: state.selectedDurationSecond);
                         Navigator.push(
                           context, MaterialPageRoute(
                            builder: (context) {
                              return ShowValue(valuemark: planAmountController.text);
                            },
                          ),
                        );
                      }
                    },
                    context: context,
                    buttonname: AppString.Next,
                    buttoncondition: planAmountController.text.isNotEmpty && offerPriceController.text.isNotEmpty && state.selectedDuration != null && state.selectedDuration!.isNotEmpty,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: size.width, height: size.height,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: horizontalPadding(
            context: context,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height / 50),
                  AnimatedContainer(
                    decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                    height: state.isToggled ? size.height / 1.5 : size.height / 1.85,
                    duration: Duration(milliseconds: 500),
                    child: horizontalPadding(
                      context: context,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height / 50),
                            Text(AppString.Channel_Plan, style: TextStyle(color: AppColor.white_color, fontWeight: FontWeight.w600, fontSize: size.width / 23)),
                            SizedBox(height: size.height / 50),
                            inputfield(
                              inputFormatters : [
                                TextInputFormatter.withFunction(formatEditUpdate),
                              ],
                              context: context,
                              hintText: AppString.hintpalnammount,
                              text: AppString.Plan_Amount,
                              controller: planAmountController,
                              keyboardType: TextInputType.number,
                            ),
                            inputfield(
                              inputFormatters : [
                                TextInputFormatter.withFunction(formatEditUpdate),
                              ],
                              context: context,
                              hintText: AppString.hintofferprice,
                              text: AppString.Offer_Price,
                              controller: offerPriceController,
                              keyboardType: TextInputType.number,
                            ),
                            SelectedDropdown(
                              onTap: () async {
                                final selected = await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    String? localSelectedDay = state.selectedDay;
                                    return StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                        return AlertDialog(
                                          elevation: 0,
                                          backgroundColor: AppColor.textfield_color,
                                          content: Container(
                                            height: size.height / 3, width: size.width,
                                            decoration: BoxDecoration(color: AppColor.textfield_color),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(AppString.Duration_Days, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 23, fontWeight: FontWeight.w600)),
                                                    GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.cancel)),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemCount: Days.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      final Day = Days[index];
                                                      bool isSelected = localSelectedDay == Day;
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            localSelectedDay = Day;
                                                          });
                                                           Future.delayed(Duration(milliseconds: 200), () {
                                                             Navigator.pop(context, Day);
                                                           });
                                                          },
                                                        child: Container(
                                                          height: size.height / 20, width: size.width,
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray_color))),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              (isSelected) ? Row (
                                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                 children: [
                                                                  Text(Day, style: TextStyle(fontWeight: FontWeight.w500, foreground: Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.yellow_color, AppColor.orange_color],).createShader(Rect.fromLTWH(0, 0, 200, 70)))),
                                                                   SvgPicture.asset(AppIcon.chake),
                                                                  ],
                                                              ) : Text(Day, style: TextStyle(color: AppColor.white_color)),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                                channal.selectDuration(selected!);
                              },
                              context: context,
                              text: state.selectedDuration ?? AppString.Duration_Days,
                              condition: state.selectedDuration != null,
                              heding: AppString.Duration_Days,
                            ),
                            SizedBox(height: size.height / 50),
                            Row(
                              children: [
                                SizedBox(width: size.width / 1.7, child: Text(AppString.Do_You_Want, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 25))),
                                GestureDetector(
                                  onTap: () => channal.toggleContainerHeight(),
                                  child: swichs(isToggled: state.isToggled),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height / 50),
                            (state.isToggled) ? SelectedDropdown(
                              onTap: () async {
                                final selected2 = await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    String? localSelectedDay = state.selectedDay;
                                    return StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                        return AlertDialog(
                                          elevation: 0,
                                          backgroundColor: AppColor.textfield_color,
                                          content: Container(
                                            height: size.height / 3, width: size.width,
                                            decoration: BoxDecoration(color: AppColor.textfield_color),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(AppString.Duration_Days, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 23, fontWeight: FontWeight.w600)),
                                                    GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.cancel)),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    itemCount: Days.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      final Day = Days[index];
                                                      bool isSelected = localSelectedDay == Day;
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            localSelectedDay = Day;
                                                          });
                                                           Future.delayed(Duration(milliseconds: 200), () {
                                                             Navigator.pop(context, Day);
                                                           });
                                                          },
                                                        child: Container(
                                                          height: size.height / 20, width: size.width,
                                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray_color))),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              (isSelected) ? Row (
                                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                 children: [
                                                                  Text(Day, style: TextStyle(fontWeight: FontWeight.w500, foreground: Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColor.yellow_color, AppColor.orange_color],).createShader(Rect.fromLTWH(0, 0, 200, 70)))),
                                                                   SvgPicture.asset(AppIcon.chake),
                                                                  ],
                                                              ) : Text(Day, style: TextStyle(color: AppColor.white_color)),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                                channal.selectTrialPeriod(selected2!);
                              },
                              context: context,
                              text: state.selectedDurationSecond ?? AppString.SelectTrailPlanDays,
                              condition: state.selectedDurationSecond != null,
                              heding: AppString.TrailPlanDays,
                            ) : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );},
    );
  }
}
