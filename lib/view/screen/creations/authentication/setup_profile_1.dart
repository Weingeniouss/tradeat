// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_local_variable

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../utils/responsive.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/inputfield.dart';
import '../../../utils/widget/profile_container.dart';

class SetupProfile_frist extends StatefulWidget {
  const SetupProfile_frist({super.key});

  @override
  State<SetupProfile_frist> createState() => _SetupProfile_fristState();
}

class _SetupProfile_fristState extends State<SetupProfile_frist> {
  File? image;

  int charCount = 0;
  int maxLength = 100;

  double progress = 0;
  double add = 25;

  bool isphotosProgressAdded = false;
  bool isNameProgressAdded = false;
  bool isEmailProgressAdded = false;
  bool isAboutProgressAdded = false;

Future<void> pickimage() async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      image = File(pickedImage.path); // Assign image first

      if (!isphotosProgressAdded) {
        progress += add;
        isphotosProgressAdded = true;
      }
    });
  }
}

  TextEditingController fullname_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController about_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    about_controller.addListener(() {
      setState(() {
        charCount = about_controller.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    double appbarsize = size.height / 5;
    final heding_size = heading(context);
    final subheding_size = subheading(context);
    final responsivetext = responsive_text(context);
    return Scaffold(
      appBar: authenticationAppBar(context: context, progress: progress),
      body: Container(
        width: size.width, height: size.height,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: Column(
          children: [
            SizedBox(height: size.height / 60),
            Expanded(
              child: SingleChildScrollView(
                child: horizontalPadding(
                  context: context,
                  child: ProfileContainer(
                    context: context,
                    Widget: horizontalPadding(
                      context: context,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height / 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => pickimage(),
                                child: (image != null) ? Column(
                                  children: [
                                    ClipOval(child: Image.file(image!, width: 90, height: 90, fit: BoxFit.cover)),
                                    SizedBox(height: size.height / 70),
                                    Text('Profile Photo', style: TextStyle(color: AppColor.white_color, fontSize: responsivetext.value)),
                                  ],
                                ) : SvgPicture.asset(AppIcon.select_profile),
                              )
                            ],
                          ),
                          SizedBox(height: size.height / 50),
                          inputfield(
                            onChanged: (val) {
                              if (!isNameProgressAdded && fullname_controller.text.isNotEmpty && fullname_controller.text.length > 4) {
                                setState(() {
                                  progress += add;
                                  isNameProgressAdded = true;
                                });
                              }
                            },
                            context: context,
                            hintText: AppString.hint_name,
                            text: AppString.name,
                            controller: fullname_controller,
                          ),
                          inputfield(
                            onChanged: (val) {
                              if (!isEmailProgressAdded && email_controller.text.isNotEmpty && email_controller.text.length > 10) {
                                setState(() {
                                  progress += add;
                                  isEmailProgressAdded = true;
                                });
                              }
                            },
                            context: context,
                            hintText: AppString.hint_Email,
                            text: AppString.Email,
                            controller: email_controller,
                          ),
                          Aboutinputfield(
                              onChanged: (val) {
                                if (!isAboutProgressAdded && about_controller.text.isNotEmpty && about_controller.text.length > 10) {
                                  setState(() {
                                    progress += add;
                                    isAboutProgressAdded = true;
                                  });
                                }
                              },
                              abouting_controller: about_controller),
                          SizedBox(height: size.height / 40),
                          Container(
                            width: size.width, height: size.height / 14,
                            decoration: BoxDecoration(
                              gradient: (isNameProgressAdded == true && isEmailProgressAdded == true && isAboutProgressAdded == true && isphotosProgressAdded == true) ?  LinearGradient(colors: [AppColor.yellow_color,AppColor.orange_color],begin: Alignment.topCenter,end: Alignment.bottomCenter) : null,
                                color: AppColor.disable_button_color, borderRadius: BorderRadius.circular(size.width / 50)),
                            child: Center(
                              child: Text(AppString.Save, style: TextStyle(color: (isNameProgressAdded == true && isEmailProgressAdded == true && isAboutProgressAdded == true && isphotosProgressAdded == true) ? AppColor.button_text_color : AppColor.other_text_color, fontSize: responsivetext.value, fontWeight: FontWeight.w700)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
