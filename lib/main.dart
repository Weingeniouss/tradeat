// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tradeat/controller/userInterface/creations/bloc/create_plan/create_channel_permission_bloc.dart';
import 'package:tradeat/view/screen/creations/authentication/auth_mobile_number.dart';
import 'package:tradeat/view/screen/creations/authentication/setup_profile_2.dart';
import 'package:tradeat/view/screen/creations/create_plan/channel_Permission.dart';
import 'package:tradeat/view/screen/creations/create_plan/create_channel.dart';
import 'package:tradeat/view/screen/splace/logo.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'controller/userInterface/creations/bloc/authentication/auth_mobile_number_bloc/Auth_mobile_number_bloc.dart';
import 'controller/userInterface/creations/bloc/authentication/setup_profile_1/setup_profile_1_bloc.dart';
import 'controller/userInterface/creations/bloc/authentication/setup_profile_2/setup_profile_2.dart';
import 'controller/userInterface/creations/bloc/create_plan/create_channel_bloc.dart';
import 'controller/userInterface/creations/bloc/create_plan/create_plan_bloc.dart';
import 'controller/userInterface/creations/bloc/splash/logo_controller_bloc/logo_bloc.dart';
import 'controller/userInterface/creations/bloc/user_verification/mobile_otp_bloc/mobile_otp_bloc.dart';
import 'controller/userInterface/creations/event/splash/logo_controller_evant/logo_event.dart';
import 'modal/country_state_city.dart';
import 'view/screen/creations/authentication/setup_profile_1.dart';
import 'view/screen/creations/authentication/setup_profile_3.dart';
import 'view/screen/creations/create_plan/pricing_plan.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //
        //**************************** User Interface *********************
        //

        // Login page
        BlocProvider(create: (BuildContext context) => SplashBloc()..add(SplashStarted())),

        // phone Number page
        BlocProvider(create: (BuildContext context) => AuthMobileNumberBloc()),

        // mobile Otp page
        BlocProvider(create: (BuildContext context) => MobileOtpBloc()),

        //setup profile one
        BlocProvider(create: (BuildContext context) => ProfileBloc()),
        
        //setup profile two
        BlocProvider(create: (BuildContext context) => AddressBloc(select_address)),

        //pricing plan
        BlocProvider(create: (_) => PricingBloc(), child: PricingPlan()),

        //create plan
        BlocProvider(create: (_) => ChannelBloc()),

        //create Permission
        BlocProvider(create: (_) => ChannelPermissionBloc()),
      ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            Breakpoint(start: 0, end: 320, name: 'Small Mobile'),
            Breakpoint(start: 412, end: 732, name: 'Smalling Mobile'),
            Breakpoint(start: 321, end: 450, name: 'Mobile'),
            Breakpoint(start: 451, end: 600, name: 'Small Tablet'),
            Breakpoint(start: 601, end: 800, name: 'Tablet'),
            Breakpoint(start: 801, end: 1024, name: 'Large Tablet'),
            Breakpoint(start: 1025, end: 1200, name: 'Desktop'),
            Breakpoint(start: 1201, end: double.infinity, name: 'XL'),
          ],
        ),
        theme: ThemeData(fontFamily: 'Poppins',dialogBackgroundColor: AppColor.textfield_color),
        debugShowCheckedModeBanner: false,
        home: Logo(),
      ),
    );
  }
}
