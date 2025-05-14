// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../../controller/userInterface/creations/bloc/authentication/setup_profile_1/setup_profile_1_bloc.dart';
import '../../../../controller/userInterface/creations/event/authentication/setup_profile_1_event/setup_mobile_number_event.dart';
import '../../../../controller/userInterface/creations/state/authentication/setup_profile_1/setup_profile_1_state.dart';
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

  TextEditingController fullname_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController about_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    double appbarsize = size.height / 5;
    final heding_size = heading(context);
    final subheding_size = subheading(context);
    final responsivetext = responsive_text(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context , state) {
        return Scaffold(
        appBar: authenticationAppBar(context: context, progress: state.progress),
        body: Container(
          width: size.width,
          height: size.height,
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
                                  onTap: () => context.read<ProfileBloc>().add(PickImageEvent()),
                                  child: (state.image != null)
                                      ? Column(
                                          children: [
                                            ClipOval(child: Image.file(state.image!, width: 90, height: 90, fit: BoxFit.cover)),
                                            SizedBox(height: size.height / 70),
                                            Text('Profile Photo', style: TextStyle(color: AppColor.white_color, fontSize: responsivetext.value)),
                                          ],
                                        )
                                      : SvgPicture.asset(AppIcon.select_profile),
                                )
                              ],
                            ),
                            SizedBox(height: size.height / 50),
                            inputfield(
                              onChanged: (val) => context.read<ProfileBloc>().add(NameEnteredEvent()),
                              context: context,
                              hintText: AppString.hint_name,
                              text: AppString.name,
                              controller: fullname_controller,
                            ),
                            inputfield(
                              onChanged: (val) => context.read<ProfileBloc>().add(EmailEnteredEvent()),
                              context: context,
                              hintText: AppString.hint_Email,
                              text: AppString.Email,
                              controller: email_controller,
                            ),
                            Aboutinputfield(
                                onChanged: (val) => context.read<ProfileBloc>().add(AboutTextChangedEvent(val)),
                                abouting_controller: about_controller,
                            ),
                            SizedBox(height: size.height / 40),
                            Container(
                              width: size.width,
                              height: size.height / 14,
                              decoration: BoxDecoration(
                                  gradient: (state.isNameAdded == true && state.isEmailAdded == true && state.isAboutAdded == true && state.isPhotoAdded == true)
                                      ? LinearGradient(
                                          colors: [AppColor.yellow_color, AppColor.orange_color],
                                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                        )
                                      : null,
                                  color: AppColor.disable_button_color,
                                  borderRadius:
                                      BorderRadius.circular(size.width / 50)),
                              child: Center(
                                child: Text(AppString.Save,
                                    style: TextStyle(
                                        color: (state.isNameAdded == true && state.isEmailAdded == true && state.isAboutAdded == true && state.isPhotoAdded == true)
                                            ? AppColor.button_text_color : AppColor.other_text_color,
                                        fontSize: responsivetext.value, fontWeight: FontWeight.w700,
                                    ),
                                ),
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
      },
    );
  }
}
