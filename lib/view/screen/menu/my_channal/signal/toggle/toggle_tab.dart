// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_import, depend_on_referenced_packages, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../../../utils/app_icon.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/widget/authentication_appbar.dart';
import '../../../../../utils/widget/inputfield.dart';

class ToggleTab extends StatefulWidget {
  final String stockname;
  final String name;
  final String equity_cuurrunt;
  final String profite;
  final String Open;
  final String High;
  final String Low;
  final String Prev_Close;
  final String stock;
  final String stock_name;

  ToggleTab({
    super.key,
    required this.stockname,
    required this.name,
    required this.equity_cuurrunt,
    required this.profite,
    required this.Open,
    required this.High,
    required this.Low,
    required this.Prev_Close,
    required this.stock,
    required this.stock_name
  });

  @override
  State<ToggleTab> createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab> {

  TextEditingController OrderPrice_controller = TextEditingController();
  TextEditingController TargetPrice1_controller = TextEditingController();
  TextEditingController TargetPrice2_controller = TextEditingController();
  TextEditingController TargetPrice3_controller = TextEditingController();
  TextEditingController StopLoss_controller = TextEditingController();

  bool SummaryAnimation = false;

  double values = 0;

  void Sliderbar(val){
    setState(() {
      values = val;
      print(values);
    });
  }

  void Summaryindex() {
    setState(() {
      SummaryAnimation = !SummaryAnimation;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context, icons: AppIcon.left, text: widget.stockname),
      body: Container(
        height: size.height, width: size.width,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: SingleChildScrollView(
          child: horizontalPadding(
            context: context,
            child: Column(
              children: [
                SizedBox(height: size.height / 50),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300), padding:  EdgeInsets.all(20), constraints: BoxConstraints(),
                  decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(), child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.stock,style: TextStyle(color: AppColor.other_text_color)),
                            Text(widget.equity_cuurrunt,style: TextStyle(color: AppColor.white_color,fontWeight: FontWeight.w500,fontSize: size.width / 27)),
                          ],
                        ),
                        SizedBox(height: size.height / 200),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.stock_name,style: TextStyle(color: AppColor.white_color,fontSize: size.width / 25,fontWeight: FontWeight.w600)),
                            Text(widget.profite,style: TextStyle(color: AppColor.green_color,fontWeight: FontWeight.w500,fontSize: size.width / 29)),
                          ],
                        ),
                        SizedBox(height: size.height / 50),
                        GestureDetector(
                          onTap: Summaryindex,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppString.Summary,style: TextStyle(fontSize: size.width / 25,color: AppColor.white_color,fontWeight: FontWeight.w600)),
                              AnimatedSwitcher(
                              duration: Duration(milliseconds: 800),
                              transitionBuilder: (child, animation) {
                                return RotationTransition(
                                  turns: Tween(begin: 0.75, end: 1.0).animate(animation),
                                  child: FadeTransition(opacity: animation, child: child),
                                );
                              },
                              child: SvgPicture.asset(
                                 (SummaryAnimation) ? AppIcon.up : AppIcon.down,
                                 key: ValueKey(SummaryAnimation),
                                 color: (SummaryAnimation) ? AppColor.white_color : AppColor.white_color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                          alignment: Alignment.topCenter,
                          child: AnimatedOpacity(
                            opacity: SummaryAnimation ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 800),
                            child: (SummaryAnimation) ?  Column(
                            children: [SizedBox(height: size.height / 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Open',style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 33)),
                                      SizedBox(height: size.height / 250),
                                      Text(widget.Open,style: TextStyle(color: AppColor.white_color,fontWeight: FontWeight.w500,fontSize: size.width / 33)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('High',style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 33)),
                                      SizedBox(height: size.height / 250),
                                      Text(widget.High,style: TextStyle(color: AppColor.white_color,fontWeight: FontWeight.w500,fontSize: size.width / 33)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Low',style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 33)),
                                      SizedBox(height: size.height / 250),
                                      Text(widget.Low,style: TextStyle(color: AppColor.white_color,fontWeight: FontWeight.w500,fontSize: size.width / 33)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Prev. Close',style: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 33)),
                                      SizedBox(height: size.height / 250),
                                      Text(widget.Prev_Close,style: TextStyle(color: AppColor.white_color,fontWeight: FontWeight.w500,fontSize: size.width / 33)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height / 150),
                              Divider(color: AppColor.gray_color),
                              SizedBox(height: size.height / 80),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppString.TodaysLow,style: TextStyle(color: AppColor.other_text_color)),
                                      Text(widget.Open,style: TextStyle(color: AppColor.white_color)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppString.TodaysHigh,style: TextStyle(color: AppColor.other_text_color)),
                                      Text(widget.Low,style: TextStyle(color: AppColor.white_color)),
                                     ],
                                    ),
                                  ],
                                ),
                               Slider(
                                   thumbColor: AppColor.gray_color,
                                   autofocus: true,
                                   activeColor: AppColor.gray_color,
                                   value: values, onChanged: (val) {
                                  setState(() {
                                    values = val;
                                    print(values);
                                  });
                                }),
                              SizedBox(height: size.height /50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppString.WeekLow,style: TextStyle(color: AppColor.other_text_color)),
                                      Text(widget.Open,style: TextStyle(color: AppColor.white_color)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppString.WeekHigh,style: TextStyle(color: AppColor.other_text_color)),
                                      Text(widget.Low,style: TextStyle(color: AppColor.white_color)),
                                     ],
                                    ),
                                  ],
                                ),
                               Slider(
                                   thumbColor: AppColor.gray_color,
                                   autofocus: true,
                                   activeColor: AppColor.gray_color,
                                   value: values, onChanged: (val) {
                                     Sliderbar(val);
                                }),
                              ],
                            ) : SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height / 50),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.textfield_color,
                    borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.SignalDetails,style: TextStyle(color: AppColor.white_color,fontSize: size.width / 25,fontWeight: FontWeight.w600)),
                      SizedBox(height: size.height / 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                              border: Border.all(color: AppColor.Lred_color),
                            ),
                            child: Center(
                              child: Text('SELL',style: TextStyle(color: AppColor.Lred_color,fontWeight: FontWeight.w600,fontSize: size.width / 27)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                              border: Border.all(color: AppColor.Lgreen_color),
                            ),
                            child: Center(
                              child: Text('BUY',style: TextStyle(color: AppColor.Lgreen_color,fontWeight: FontWeight.w600,fontSize: size.width / 27)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 30),
                      inputfield(
                        context: context,
                        hintText: AppString.hintSignalDetails,
                        text: AppString.SignalDetails,
                        controller: OrderPrice_controller,
                      ),
                      inputfield(
                        context: context,
                        hintText: AppString.hintTargetPrice1,
                        text: AppString.TargetPrice1,
                        controller: TargetPrice1_controller,
                      ),
                      inputfield(
                        context: context,
                        hintText: AppString.hintTargetPrice2,
                        text: AppString.TargetPrice2,
                        controller: TargetPrice2_controller,
                      ),
                      inputfield(
                        context: context,
                        hintText: AppString.hintTargetPrice3,
                        text: AppString.TargetPrice3,
                        controller: TargetPrice3_controller,
                      ),
                      inputfield(
                        context: context,
                        hintText: AppString.hintStopLoss,
                        text: AppString.StopLoss,
                        controller: StopLoss_controller,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height / 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
