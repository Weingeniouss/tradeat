// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/userInterface/creations/bloc/authentication/setup_profile_1/setup_profile_1_bloc.dart';
import '../../../controller/userInterface/creations/state/authentication/setup_profile_1/setup_profile_1_state.dart';
import '../app_color.dart';
import '../app_string.dart';
import '../responsive.dart';
import 'app_size.dart';

class Aboutinputfield extends StatelessWidget {
  final TextEditingController abouting_controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? hintText;
  final String? text;
  final Widget? widget;

  const Aboutinputfield({
    super.key,
    required this.abouting_controller,
    this.onChanged,
    this.onTap,
    this.hintText,
    this.text,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final responsivetext = responsive_text(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, state) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text ?? AppString.About_You,
                style: TextStyle(
                  fontSize: responsivetext.value,
                  color: AppColor.other_text_color,
                ),
              ),
              if (widget != null) widget!,
            ],
          ),
          SizedBox(height: size.height / 80),
          SizedBox(
            height: size.height / 6.5,
            child: Stack(
              children: [
                TextField(
                  onChanged: onChanged,
                  onTap: onTap,
                  cursorColor: AppColor.white_color,
                  controller: abouting_controller,
                  maxLines: 100,
                  maxLength: state.maxLength,
                  style: TextStyle(color: AppColor.white_color, fontSize: responsivetext.value),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(color: AppColor.other_text_color,fontSize: size.width / 26),
                    contentPadding: EdgeInsets.symmetric(vertical: size.width / 15, horizontal: size.width / 15),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.textfield_color_2), borderRadius: BorderRadius.circular(size.width / 30)),
                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.textfield_color_2), borderRadius: BorderRadius.circular(size.width / 30)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.textfield_color_2), borderRadius: BorderRadius.circular(size.width / 30)),
                    counterText: '',
                  ),
                ),
                Positioned(bottom: 8, right: 12, child: Text('${state.charCount}/${state.maxLength}', style: TextStyle(color: Colors.grey[400], fontSize: size.width / 35))),
              ],
            ),
          ),
        ],
      );
      },
    );
  }
}

Widget inputfield({
  Widget? suffixIcon,
  int? maxLength,
  TextInputType? keyboardType,
  void Function(String)? onChanged,
  void Function()? onTap,
  required BuildContext context,
  required String hintText,
  required String text,
  required TextEditingController controller,
  List<TextInputFormatter>? inputFormatters
}) {
  final size = AppSize(context);
  final responsivetext = responsive_text(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text, style: TextStyle(color: AppColor.other_text_color, fontSize: responsivetext.value)),
      SizedBox(height: size.height / 80),
      TextField(
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTap: onTap,
        cursorColor: AppColor.white_color,
        controller: controller,
        style: TextStyle(color: AppColor.white_color),
        decoration: InputDecoration(suffixIcon: Padding(padding: EdgeInsets.all(8.0), child: suffixIcon),
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.gray_color,fontWeight: FontWeight.w300,fontSize: size.width / 28),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(size.width / 30), borderSide: BorderSide(color: AppColor.textfield_color_2)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(size.width / 30), borderSide: BorderSide(color: AppColor.textfield_color_2)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(size.width / 30), borderSide: BorderSide(color: AppColor.textfield_color_2)),
        ),
      ),
      SizedBox(height: size.height / 35),
    ],
  );
}
