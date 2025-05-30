// ignore_for_file: unused_import, non_constant_identifier_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tradeat/modal/days.dart';
import 'package:tradeat/view/utils/app_color.dart';
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

class ChannelPlan extends StatefulWidget {
  const ChannelPlan({super.key});

  @override
  State<ChannelPlan> createState() => _ChannelPlanState();
}

class _ChannelPlanState extends State<ChannelPlan> {

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


  bool isToggled = false;

  String? selectedDuration;
  String? selectedDay;


  String? selectedDuration_second;
  String? selectedDay_second;


  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: Column(
          children: [
            Center(
              child: horizontalPadding(
                context: context,
                child: Button(
                  onTap: (){
                    if(planAmountController.text.isNotEmpty && offerPriceController.text.isNotEmpty && selectedDuration != null && selectedDuration!.isNotEmpty) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShowValue()));
                    }
                  },
                  context: context,
                  buttonname: AppString.Next,
                  buttoncondition: planAmountController.text.isNotEmpty && offerPriceController.text.isNotEmpty && selectedDuration != null && selectedDuration!.isNotEmpty,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: horizontalPadding(
            context: context,
            child: Column(
              children: [
                SizedBox(height: size.height / 50),
                AnimatedContainer(
                  decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                  height: isToggled ? size.height / 1.5 : size.height / 1.85,
                  duration: Duration(milliseconds: 500),
                  child: horizontalPadding(
                    context: context,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height / 50),
                            Text(AppString.Channel_Plan, style: TextStyle(color: AppColor.white_color, fontWeight: FontWeight.w600, fontSize: size.width / 23)),
                            SizedBox(height: size.height / 50),
                            inputfield(
                              inputFormatters : [TextInputFormatter.withFunction(formatEditUpdate)],
                              context: context,
                              hintText: AppString.hintpalnammount,
                              text: AppString.Plan_Amount,
                              controller: planAmountController,
                              keyboardType: TextInputType.number,
                            ),
                            inputfield(inputFormatters : [TextInputFormatter.withFunction(formatEditUpdate)],
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
                                    String? localSelectedDay = selectedDay;
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
                                if (selected != null) {
                                  setState(() {
                                    selectedDuration = selected;
                                    selectedDay = selected;
                                  });
                                }
                              },
                              context: context,
                              text: selectedDuration ?? AppString.Duration_Days,
                              condition: selectedDuration != null,
                              heding: AppString.Duration_Days,
                            ),
                            SizedBox(height: size.height / 50),
                            Row(
                              children: [
                                SizedBox(width: size.width / 1.7, child: Text(AppString.Do_You_Want, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 25))),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isToggled = !isToggled;
                                    });
                                  },
                                  child: swichs(isToggled: isToggled),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height / 50),
                            (isToggled) ? SelectedDropdown(
                              onTap: () async {
                                final selected2 = await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    String? localSelectedDay = selectedDay;
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
                                if (selected2 != null) {
                                  setState(() {
                                    selectedDuration_second = selected2;
                                    selectedDay_second = selected2;
                                  });
                                }
                              },
                              context: context,
                              text: selectedDuration_second ?? AppString.SelectTrailPlanDays,
                              condition: selectedDuration_second != null,
                              heding: AppString.TrailPlanDays,
                            ) : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
