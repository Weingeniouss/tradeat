// ignore_for_file: prefer_const_constructors, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';
import '../app_color.dart';
import '../app_gif.dart';
import '../app_icon.dart';
import '../app_string.dart';
import '../responsive.dart';
import 'app_size.dart';
import 'button.dart';
import 'inputfield.dart';

class CardVerification extends StatefulWidget {
  final String true_icons;
  final String flase_icon;
  final String hedingString;
  final String cardnumber;
  final String otp_number;
  final TextEditingController cart_controller;
  final TextEditingController cart_Otp_controller;
  final void Function()? onTap;
  final int? maxLength;
  final bool? buttoncondition;


  const CardVerification({
    super.key,
    required this.true_icons,
    required this.flase_icon,
    required this.hedingString,
    required this.cardnumber,
    required this.otp_number,
    required this.cart_controller,
    required this.cart_Otp_controller,
    this.onTap,
    this.maxLength,
    this.buttoncondition = false
  });

  @override
  State<CardVerification> createState() => _CardVerificationState();
}

class _CardVerificationState extends State<CardVerification> {
  bool pancards = false;
  bool pancards_otp = false;
  int waitDurationInSeconds = 2;
  bool allset = false;


  final ValueNotifier<bool> isValid = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    widget.cart_controller.addListener(validateInputs);
    widget.cart_Otp_controller.addListener(validateInputs);
    widget.cart_controller.addListener(() {
      isValid.value = widget.cart_controller.text.length >= 10;
    });
  }

  void validateInputs() {
    setState(() {});
  }

  void pancard() {
    setState(() {
      pancards = true;
    });
  }

  void verify_value() {
    setState(() {
      pancards_otp = true;
      if (widget.cart_Otp_controller.text.length == 4 && widget.cart_controller.text.length >= 10) {
        allset = true;
        if (widget.onTap != null) {widget.onTap!();}
        pancards = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final responsive = responsive_text(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () => pancard(),
          child: AnimatedContainers(
            context: context,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width / 1.5,
                          child: Row(
                            children: [
                              (allset)
                                  ? SvgPicture.asset(widget.true_icons)
                                  : (pancards)
                                  ? SvgPicture.asset(widget.flase_icon, color: AppColor.white_color)
                                  : SvgPicture.asset(widget.flase_icon,color: AppColor.other_text_color),
                              SizedBox(width: size.width / 50),
                              Text(
                                widget.hedingString,
                                style: TextStyle(
                                  color: (pancards)
                                      ? AppColor.white_color
                                      : AppColor.other_text_color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: responsive.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return RotationTransition(
                              turns: Tween(begin: 0.75, end: 1.0).animate(animation),
                              child: FadeTransition(opacity: animation, child: child),
                            );
                          },
                          child: SvgPicture.asset(
                            (pancards)
                                ? AppIcon.up
                                : AppIcon.down, key: ValueKey(pancards),
                            color: (pancards)
                                ? null
                                : AppColor.other_text_color,
                          ),
                        ),
                      ],
                    ),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: (pancards)
                            ? SizedBox(height: size.height / 150)
                            : SizedBox()),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: (pancards)
                            ? Divider(color: AppColor.textfield_color_2)
                            : SizedBox()),
                    AnimatedSwitcher(
                      duration: Duration(seconds: 1),
                      child: (pancards)
                          ? Column(
                              children: [
                                inputfield(suffixIcon: (pancards_otp) ? SvgPicture.asset(AppIcon.Suessess,fit:BoxFit.contain) : null, maxLength: widget.maxLength, context: context, hintText: AppString.hint_Pan_Card_number, text: widget.cardnumber, controller: widget.cart_controller),
                                (pancards_otp)
                                    ? inputfield(maxLength: 4, context: context, keyboardType: TextInputType.number, hintText: AppString.hint_OTP, text: widget.otp_number, controller: widget.cart_Otp_controller)
                                    : SizedBox(),
                                ValueListenableBuilder<bool>(
                                  valueListenable: isValid,
                                  builder: (context, valid, child) {
                                    return Button(
                                        onTap: () {
                                          setState(() {
                                            if (widget.cart_controller.text.length >= 10) {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (BuildContext context) {
                                                    Future.delayed(Duration(seconds: waitDurationInSeconds), () {
                                                      Navigator.pop(context);
                                                      verify_value();
                                                    });
                                                    return AlertDialog(
                                                      backgroundColor: AppColor.white_color,
                                                      content: Container(
                                                        height: size.height / 15,
                                                        width: size.width,
                                                        decoration: BoxDecoration(color: AppColor.white_color),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(AppGif.loader),
                                                            SizedBox(width: size.width / 20),
                                                            Text(AppString.Please_Wait, style: TextStyle(fontSize: responsive.value, fontWeight: FontWeight.w700)),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            }
                                          });
                                        },
                                        context: context,
                                        buttonname: (pancards_otp)
                                            ? AppString.Save
                                            : AppString.Verify,
                                        buttoncondition: (widget.buttoncondition) ?? valid
                                            ? pancards_otp
                                            ? widget.cart_Otp_controller.text.length == 4
                                            : widget.cart_controller.text.length >= 10
                                            : false,
                                    );
                                  },
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
            ),
          ),
        ),
        SizedBox(height: size.height / 50),
      ],
    );
  }
}


// buttoncondition: valid
// ? pancards_otp
// ? widget.cart_Otp_controller.text.length == 4
// : widget.cart_controller.text.length >= 10
// : false,