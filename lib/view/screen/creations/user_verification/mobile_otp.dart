// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tradeat/view/screen/creations/authentication/setup_profile_1.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import '../../../../controller/userInterface/bloc/user_verification/mobile_otp_bloc/mobile_otp_bloc.dart';
import '../../../../controller/userInterface/event/user_verification/mobile_otp_event/mobile_otp_event.dart';
import '../../../../controller/userInterface/state/user_verification/mobile_otp_state/mobile_otp_state.dart';
import '../../../utils/responsive.dart';
import '../../../utils/widget/horizontal_padding.dart';

class MobileOtp extends StatefulWidget {
  final String number;
  final String countrycode;

  const MobileOtp({super.key, required this.number, required this.countrycode});

  @override
  State<MobileOtp> createState() => _MobileOtpState();
}

class _MobileOtpState extends State<MobileOtp> {
  TextEditingController otpController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<MobileOtpBloc>().add(StartOtpTimer());
    WidgetsBinding.instance.addPostFrameCallback((_) => FocusScope.of(context).requestFocus(focusNode));
  }

  @override
  void dispose() {
    super.dispose();
    context.read<MobileOtpBloc>().add(StartOtpTimer());
    WidgetsBinding.instance.addPostFrameCallback((_) => FocusScope.of(context).requestFocus(focusNode));
  }

  @override
  Widget build(BuildContext context) {
    final hedingSize = heading(context);
    final responsivetext = responsive_text(context);

    final size = AppSize(context);

    const int otptextfieldLength = 6;
    final aapbarsixe = size.height / 4;

    return BlocBuilder<MobileOtpBloc, MobileOtpState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(aapbarsixe),
            child: Container(
              width: size.width,
              height: aapbarsixe,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: SafeArea(
                child: horizontalPadding(
                  context: context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 30),
                      GestureDetector(onTap: () => Navigator.pop(context), child: SvgPicture.asset(AppIcon.left)),
                      SizedBox(height: size.height / 30),
                      Text(AppString.Enter_num, style: TextStyle(color: AppColor.white_color, fontSize: hedingSize.value, fontWeight: FontWeight.w700)),
                      Text('${widget.countrycode}${widget.number}', style: TextStyle(color: AppColor.white_color, fontSize: hedingSize.value, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: AppColor.black_color),
            child: horizontalPadding(
              context: context,
              child: Column(
                children: [
                  PinCodeTextField(
                    enablePinAutofill: true,
                    appContext: context,
                    controller: otpController,
                    focusNode: focusNode,
                    length: otptextfieldLength,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: AppColor.textfield_color,
                      inactiveFillColor: AppColor.textfield_color,
                      selectedFillColor: AppColor.textfield_color,
                      activeColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: AppColor.black_color,
                    enableActiveFill: true,
                    textStyle: TextStyle(color: AppColor.white_color, fontSize: 17),
                    onChanged: (value) {
                      if (value.length == 6) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SetupProfile_frist()));
                      }
                    },
                  ),
                  SizedBox(height: size.height / 30),
                  (state.start == 0)
                      ? Text(
                          AppString.ResendOTP,
                          style: TextStyle(
                            fontSize: responsivetext.value,
                            fontWeight: FontWeight.w700,
                            foreground: Paint()..shader = LinearGradient(
                                colors: [
                                  AppColor.yellow_color, AppColor.orange_color,
                                ],
                                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                              ).createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height)),
                          ),
                        )
                      : Text('Resend OTP In ${state.start.toString()} Seconds...', style: TextStyle(fontSize: responsivetext.value, fontWeight: FontWeight.w600, color: AppColor.other_text_color)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
