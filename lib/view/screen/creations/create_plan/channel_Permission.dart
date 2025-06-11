// ignore_for_file: avoid_print, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/controller/userInterface/creations/bloc/create_plan/create_channel_permission_bloc.dart';
import 'package:tradeat/controller/userInterface/creations/state/create_plan/create_channel_Permission_state.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_contrast.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/button.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/inputfield.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';
import '../../../../controller/userInterface/creations/bloc/authentication/setup_profile_1/setup_profile_1_bloc.dart';
import '../../../../controller/userInterface/creations/event/authentication/setup_profile_1_event/setup_mobile_number_event.dart';
import '../../../../controller/userInterface/creations/event/create_plan/create_channel_Permission_event.dart';
import '../../../../controller/userInterface/creations/event/create_plan/create_channel_evant.dart';
import '../../../../controller/userInterface/creations/state/authentication/setup_profile_1/setup_profile_1_state.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/swich.dart';
import 'channel_plan.dart';

class ChannelPermission extends StatefulWidget {
  ChannelPermission({super.key});

  @override
  State<ChannelPermission> createState() => _ChannelPermissionState();
}

class _ChannelPermissionState extends State<ChannelPermission> {
  TextEditingController abouting_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadSavedFeatures();
  }

   Future<void> loadSavedFeatures() async {
    final savedFeatures = pref?.getStringList('feature_list') ?? [];
    context.read<ChannelPermissionBloc>().add(LoadSavedFeaturesEvent(savedFeatures));
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    var channelPermission = context.read<ChannelPermissionBloc>();
    return BlocBuilder<ChannelPermissionBloc, ChannelPermissionState>(
      builder: (BuildContext context, state) {
         pref!.setStringList('feature_list', List<String>.from(state.features));
         pref!.setInt('feature_count', state.features.length);
        return Scaffold(
          appBar: simpaleaapbar(context),
          bottomNavigationBar: Container(
            height: size.height * 0.090,
            color: AppColor.black_color,
            child: Column(
              children: [
                (state.features.isNotEmpty) ? horizontalPadding(
                  child: Button(
                    buttoncondition: true,
                    context: context,
                    buttonname: AppString.Next,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ChannelPlan();
                        }),
                      );
                      },
                  ),
                  context: context,
                ) : SizedBox(),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width, height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: horizontalPadding(
                context: context,
                child: Column(
                  children: [
                    ProfileContainer(
                      context: context,
                      Widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height / 50),
                          Text(AppString.Channel_Permission, style: TextStyle(fontSize: size.width / 23, color: AppColor.other_text_color, fontWeight: FontWeight.w600)),
                          SizedBox(height: size.height / 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: size.width / 2, child: Text(AppString.Channel_Private, style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 26))),
                              Center(
                                child: GestureDetector(
                                  onTap: () => channelPermission.add(TogglePrivateEvent()),
                                  child: swichs(isToggled: state.isPrivate),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height / 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: size.width / 2, child: Text(AppString.Join_The_Channel, style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 26))),
                              Center(
                                child: GestureDetector(
                                  onTap: () => channelPermission.add(ToggleJoinChannelEvent()),
                                  child: swichs(isToggled: state.isJoinChannel),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 50),
                    ProfileContainer(
                      context: context,
                         Widget: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: size.height / 80),
                             Text(AppString.Channel_Features,style: TextStyle(fontSize: size.width / 23,color: AppColor.other_text_color,fontWeight: FontWeight.w600)),
                             SizedBox(height: size.height / 80),
                             BlocBuilder<ProfileBloc, ProfileState>(
                               builder: (BuildContext context, state) {
                                 return Aboutinputfield(
                                   onChanged: (val) => context.read<ProfileBloc>().add(AboutTextChangedEvent(val)),
                                   abouting_controller: abouting_controller,
                                   hintText:AppString.hintChannelFeatures,
                                   text: AppString.Channel_Features,
                                   widget: GestureDetector(
                                     onTap: () {
                                       if(abouting_controller.text.length >= 6) {
                                         channelPermission.add(AddChannelFeatureEvent(abouting_controller.text));
                                         pref!.setString('abouting', abouting_controller.text);
                                         permission = pref!.getString('abouting')!;
                                         print('abouting = $permission');

                                         final currentList = channelPermission.state.features;
                                         pref!.setStringList('feature_list', List<String>.from(currentList)..add(abouting_controller.text));
                                         feature_list = pref!.getStringList('feature_list')!;
                                         pref!.setInt('feature_count', channelPermission.state.features.length + 1);
                                       }
                                       abouting_controller.clear();
                                      },
                                      child: (abouting_controller.text.length >= 6) ? ShaderMask(
                                        shaderCallback: (bounds) => LinearGradient(colors: [AppColor.yellow_color, AppColor.orange_color], begin: Alignment.topCenter,end: Alignment.bottomCenter).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                                        child: Text(AppString.Add_Feature, style: TextStyle(color: Colors.white, fontSize: size.width / 28, fontWeight: FontWeight.bold)),
                                      ) : SizedBox(),
                                    ),
                                  );
                                },
                               ),
                             ],
                           ),
                     ),
                     SizedBox(height: size.height / 50),
                     Expanded(
                       child: ListView.builder(
                         itemCount: state.features.length,
                         itemBuilder: (BuildContext context, int index) {
                           return Column(
                             children: [
                               Container(
                               decoration: BoxDecoration(
                                 color: AppColor.textfield_color,
                                 borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                               ),
                               padding: EdgeInsets.all(10),
                               child: Row(
                                 children: [
                                   horizontalPadding(
                                       context: context,
                                       child: SizedBox(
                                         width: size.width / 2,
                                         child: Text(state.features[index], style: TextStyle(color: AppColor.other_text_color,fontWeight: FontWeight.w500),
                                         ),
                                       ),
                                   ),
                                   SvgPicture.asset(AppIcon.edit),
                                   SizedBox(width: size.width / 30),
                                   GestureDetector(
                                       child: SvgPicture.asset(AppIcon.delet),
                                       onTap: () {
                                         channelPermission.add(RemoveChannelFeatureEvent(index));
                                         final updatedList = List<String>.from(state.features)..removeAt(index);
                                         pref!.setStringList('feature_list', updatedList);
                                         feature_list = pref!.getStringList('feature_list')!;
                                       }),
                                 ],
                               )),
                               SizedBox(height: size.height / 50),
                             ],
                           );
                         },
                       ),
                     ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
