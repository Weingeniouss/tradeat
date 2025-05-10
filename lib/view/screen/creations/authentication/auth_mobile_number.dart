// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_import, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';

import '../../../../controller/userInterface/bloc/auth_mobile_number_bloc/Auth_mobile_number_bloc.dart';
import '../../../../controller/userInterface/event/auth_mobile_number_controller/auth_mobile_number__event.dart';
import '../../../../controller/userInterface/state/auth_Mobile_number_stateController/auth_Mobile_number_stateController.dart';
import '../../../../modal/country_code.dart';
import '../../../utils/widget/GradientCheckbox.dart';

class AuthMobileNumber extends StatelessWidget {
  AuthMobileNumber({super.key});

  final FocusNode focusNode = FocusNode();
  TextEditingController mobile_number_controller = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: '### ### ####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    final size = AppSize(context);
    return BlocBuilder<AuthMobileNumberBloc, AuthMobileNumberState>(
      builder: (BuildContext context, state) {
        final bloc = context.read<AuthMobileNumberBloc>();
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: size.width, height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height / 50),
                        Text(AppString.Entermobile_number, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 18)),
                        SizedBox(height: size.height / 80),
                        Text(AppString.sending, style: TextStyle(color: AppColor.gray_color, fontSize: size.width / 32)),
                        SizedBox(height: size.height / 15),
                        Row(
                          children: [
                            Container(
                              height: size.height / 14, width: size.width / 4,
                              decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                              child: Center(
                                child: DropdownButton<String>(
                                  icon: SvgPicture.asset(AppIcon.down),
                                  underline: SizedBox(),
                                  dropdownColor: AppColor.textfield_color,
                                  value: state.selectedDialCode,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      context.read<AuthMobileNumberBloc>().add(DialCodeChanged(newValue));
                                    }
                                  },
                                  items: countryCodes.map((country) {
                                    return DropdownMenuItem<String>(
                                      value: country['dial_code'],
                                      child: Text('${country['dial_code']}', style: TextStyle(color: AppColor.white_color)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
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
                                  maxLength: 12,
                                  inputFormatters: [maskFormatter],
                                  controller: mobile_number_controller,
                                  cursorColor: AppColor.white_color,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(color: AppColor.white_color),
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
                    height: size.height / 6,
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
                              SizedBox(width: size.width / 50),
                              Text(AppString.accept, style: TextStyle(color: AppColor.gray_color)),
                            ],
                          ),
                          SizedBox(height: size.height / 40),
                          GestureDetector(
                            onTap: () {
                              if (state.mobileNumber.isNotEmpty && state.isAccepted) {}
                            },
                            child: Container(
                              height: size.height / 15,
                              width: size.width,
                              decoration: BoxDecoration(
                                  gradient: (state.mobileNumber.isNotEmpty && state.isAccepted)
                                      ? LinearGradient(
                                          colors: [
                                            AppColor.yellow_color,
                                            AppColor.orange_color,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )
                                      : null,
                                  color: AppColor.button_hide_color,
                                  borderRadius: BorderRadiusDirectional.circular(size.width / 50)),
                              child: Center(child: Text(AppString.Continue, style: TextStyle(color: (state.mobileNumber.isNotEmpty && state.isAccepted) ? AppColor.white_color : AppColor.gray_color),
                              )),
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
