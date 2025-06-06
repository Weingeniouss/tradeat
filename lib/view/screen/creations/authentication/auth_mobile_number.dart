// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_import, must_be_immutable, prefer_const_constructors_in_immutables, avoid_print, unnecessary_brace_in_string_interps

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tradeat/view/screen/creations/user_verification/mobile_otp.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import '../../../../controller/database/loacl_store/local.dart';
import '../../../../controller/userInterface/creations/bloc/authentication/auth_mobile_number_bloc/Auth_mobile_number_bloc.dart';
import '../../../../controller/userInterface/creations/event/authentication/auth_mobile_number_controller/auth_mobile_number__event.dart';
import '../../../../controller/userInterface/creations/state/authentication/auth_Mobile_number_stateController/auth_Mobile_number_stateController.dart';
import '../../../../modal/country_code.dart';
import '../../../utils/responsive.dart';
import '../../../utils/widget/GradientCheckbox.dart';
import '../../../utils/widget/horizontal_padding.dart';

class AuthMobileNumber extends StatefulWidget {
  AuthMobileNumber({super.key});

  @override
  State<AuthMobileNumber> createState() => _AuthMobileNumberState();
}

class _AuthMobileNumberState extends State<AuthMobileNumber> {
  final FocusNode focusNode = FocusNode();

  TextEditingController mobile_number_controller = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(mask: '### ### ####', filter: {"#": RegExp(r'[0-9]')});

  int maxLength = 12;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final heding_size = heading(context);
    final subheding_size = subheading(context);
    final responsivetext = responsive_text(context);
    return BlocBuilder<AuthMobileNumberBloc, AuthMobileNumberState>(
      builder: (BuildContext context, state) {
        final bloc = context.read<AuthMobileNumberBloc>();
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  horizontalPadding(
                   context: context,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height / 50),
                        Text(AppString.Entermobile_number, style: TextStyle(color: AppColor.white_color, fontSize: heding_size.value,fontWeight: FontWeight.w700)),
                        SizedBox(height: size.height / 80),
                        Text(AppString.sending, style: TextStyle(color: AppColor.gray_color, fontSize: subheding_size.value,fontWeight: FontWeight.w400)),
                        SizedBox(height: size.height / 15),
                        Row(
                          children: [
                            Container(
                              height: size.height / 14, width: size.width / 4,
                              decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                              child: Center(
                                child: DropdownButton2<String>(
                                 isDense: true,
                                  iconStyleData: IconStyleData(icon: SvgPicture.asset(AppIcon.down)),
                                  underline: SizedBox(),
                                  dropdownStyleData: DropdownStyleData(
                                  maxHeight: size.height / 3,
                                  width: size.width / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(size.width / 25),
                                    color: AppColor.textfield_color,
                                  ),
                                    offset: Offset(-20, -30), elevation: 0,
                                  ),
                                   value: state.selectedDialCode,
                                    onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      print("Selected Dial Code: $newValue");
                                      context.read<AuthMobileNumberBloc>().add(DialCodeChanged(newValue));
                                    }
                                },
                                items: countryCodes.map((country) {
                                  return DropdownMenuItem<String>(
                                value: country['dial_code'],
                                  child: Text(
                                     '${country['dial_code']}',
                                      style: TextStyle(
                                       color: AppColor.white_color,
                                       fontSize: responsivetext.value,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }).toList())
                              )),
                            SizedBox(width: size.width / 30),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                              height: size.height / 14,
                              width: size.width / 1.8,
                              decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) => bloc.add(MobileNumberChanged(value)),
                                  focusNode: focusNode,
                                  maxLength: maxLength,
                                  maxLines: 1,
                                  inputFormatters: [maskFormatter],
                                  controller: mobile_number_controller,
                                  cursorColor: AppColor.white_color,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(color: AppColor.white_color, fontSize: responsivetext.value),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height / 5.7,
                    width: size.width,
                    decoration: BoxDecoration(color: AppColor.textfield_color),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height / 50),
                          Row(
                            children: [
                              GradientCheckbox(
                                value: state.isAccepted,
                                onChanged: (value) {
                                  bloc.add(TermsAcceptedChanged(value));
                                },
                              ),
                              SizedBox(width: size.width / 30),
                              SizedBox(width: size.width / 1.3, child: Text(AppString.accept, style: TextStyle(color: AppColor.gray_color, fontSize: responsivetext.value))),
                            ],
                          ),
                          SizedBox(height: size.height / 40),
                          GestureDetector(
                              onTap: () {
                                String rawNumber = maskFormatter.getUnmaskedText();
                                if (state.mobileNumber.isNotEmpty && state.isAccepted && mobile_number_controller.text.length == 12) {
                                  LocalDatabase().mobileauthenticationnumber(rawNumber);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MobileOtp(number: rawNumber, countrycode: state.selectedDialCode)));
                                }
                              },
                              child: Container(
                                height: size.height / 15,
                                width: size.width,
                                decoration: BoxDecoration(
                                  gradient: (state.mobileNumber.isNotEmpty && state.isAccepted && mobile_number_controller.text.length == 12)
                                      ? LinearGradient(
                                          colors: [
                                            AppColor.yellow_color, AppColor.orange_color,
                                          ],
                                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                        )
                                      : null,
                                  color: AppColor.button_hide_color,
                                  borderRadius: BorderRadiusDirectional.circular(size.width / 50),
                                ),
                                child: Center(
                                  child: Text(
                                    AppString.Continue,
                                    style: TextStyle(
                                      fontSize: size.width / 26,
                                      color: (state.mobileNumber.isNotEmpty && state.isAccepted && mobile_number_controller.text.length == 12)
                                          ? AppColor.button_text_color
                                          : AppColor.gray_color,
                                      fontWeight: (state.mobileNumber.isNotEmpty && state.isAccepted && mobile_number_controller.text.length == 12)
                                              ? FontWeight.w700
                                              : FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
