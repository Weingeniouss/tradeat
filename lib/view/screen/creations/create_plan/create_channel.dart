// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradeat/controller/database/loacl_store/local.dart';
import 'package:tradeat/view/screen/creations/create_plan/channel_Permission.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/button.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';
import '../../../../controller/userInterface/creations/bloc/authentication/setup_profile_1/setup_profile_1_bloc.dart';
import '../../../../controller/userInterface/creations/bloc/create_plan/create_channel_bloc.dart';
import '../../../../controller/userInterface/creations/event/authentication/setup_profile_1_event/setup_mobile_number_event.dart';
import '../../../../controller/userInterface/creations/event/create_plan/create_channel_evant.dart';
import '../../../../controller/userInterface/creations/state/authentication/setup_profile_1/setup_profile_1_state.dart';
import '../../../../controller/userInterface/creations/state/create_plan/create_channel_state.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/inputfield.dart';

class CreateChannel extends StatelessWidget {
  CreateChannel({super.key});

  final TextEditingController Channelcontroller = TextEditingController();
  final TextEditingController abouting_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: authenticationChannel(context: context),
      body: BlocBuilder<ChannelBloc, ChannelState>(
        builder: (BuildContext context, ChannelState state) {
         return Container(
          width: size.width, height: size.height,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: horizontalPadding(
            context: context,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height / 50),
                  ProfileContainer(
                    context: context,
                    Widget: Column(
                      children: [
                        inputfield(onChanged: (text) => context.read<ChannelBloc>().add(ChannelTextChanged(text)),context: context, hintText: AppString.hintChannel, text: AppString.Channel, controller: Channelcontroller),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (BuildContext context, state) {
                            return Aboutinputfield(onChanged: (text) {
                              context.read<ProfileBloc>().add(AboutTextChangedEvent(text));
                              context.read<ChannelBloc>().add(AboutingTextChanged(text));
                            }, abouting_controller: abouting_controller,hintText: AppString.hintChannel,
                            );
                          },
                          ),
                          SizedBox(height: size.height / 40),
                          Button(onTap: () {
                            if(state.isValid) {
                              LocalDatabase().create_channale(Channelcontroller, abouting_controller);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelPermission()));
                            }
                          },context: context,buttoncondition: state.isValid, buttonname: AppString.Next),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
