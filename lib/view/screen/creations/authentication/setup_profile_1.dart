// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, must_be_immutable, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/controller/database/loacl_store/local.dart';
import 'package:tradeat/view/screen/creations/authentication/setup_profile_2.dart';
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
import '../../../utils/widget/button.dart';
import '../../../utils/widget/inputfield.dart';
import '../../../utils/widget/profile_container.dart';

class SetupProfile_frist extends StatelessWidget {
  SetupProfile_frist({super.key});
  TextEditingController fullname_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController about_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final heding_size = heading(context);
    final subheding_size = subheading(context);
    final responsivetext = responsive_text(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: authenticationAppBar(context: context, progress: state.progress),
          body: Container(
            width: size.width, height: size.height,
            decoration: BoxDecoration(color: AppColor.black_color),
            child: Column(
              children: [
                SizedBox(height: size.height / 60),
                Expanded(
                  child: SingleChildScrollView(
                    child: horizontalPadding(context: context,
                      child: ProfileContainer(context: context,
                        Widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => context.read<ProfileBloc>().add(PickImageEvent()),
                                    child: (state.image != null) ? Column(
                                      children: [
                                        ClipOval(child: Image.file(state.image!, width: 80, height: 80, fit: BoxFit.cover)),
                                        SizedBox(height: size.height / 70),
                                        Text('Profile Photo', style: TextStyle(color: AppColor.white_color, fontSize: responsivetext.value)),
                                      ],
                                    ) : SvgPicture.asset(AppIcon.select_profile),
                                  )
                                ],
                              ),
                              SizedBox(height: size.height / 50),
                              inputfield(onChanged: (val) => context.read<ProfileBloc>().add(NameEnteredEvent(fullname_controller.text)), context: context, hintText: AppString.hint_name, text: AppString.name, controller: fullname_controller),
                              inputfield(onChanged: (val) => context.read<ProfileBloc>().add(EmailEnteredEvent(email_controller.text)), context: context, hintText: AppString.hint_Email, text: AppString.Email, controller: email_controller),
                              Aboutinputfield(onChanged: (val) => context.read<ProfileBloc>().add(AboutTextChangedEvent(val)), abouting_controller: about_controller),
                              SizedBox(height: size.height / 40),
                              Button(
                              onTap: () {
                                if(state.isNameAdded == true && state.isEmailAdded == true && state.isAboutAdded == true && state.isPhotoAdded == true){
                                  LocalDatabase().setup_profile_one(fullname_controller, email_controller, about_controller);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SetupProfile_scecond()));
                                   }
                                 }, context: context, buttoncondition: state.isNameAdded == true && state.isEmailAdded == true && state.isAboutAdded == true && state.isPhotoAdded == true
                              ),
                            ],
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
