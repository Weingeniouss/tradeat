// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradeat/controller/userInterface/creations/bloc/create_plan/create_channel_permission_bloc.dart';
import 'package:tradeat/view/screen/creations/authentication/auth_mobile_number.dart';
import 'package:tradeat/view/screen/creations/authentication/setup_profile_2.dart';
import 'package:tradeat/view/screen/creations/create_plan/channel_Permission.dart';
import 'package:tradeat/view/screen/creations/create_plan/channel_plan.dart';
import 'package:tradeat/view/screen/creations/create_plan/create_channel.dart';
import 'package:tradeat/view/screen/splace/logo.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_contrast.dart';
import 'package:tradeat/view/utils/widget/bottam_navigation/Daily_Trading_navigation.dart';
import 'controller/userInterface/creations/bloc/authentication/auth_mobile_number_bloc/Auth_mobile_number_bloc.dart';
import 'controller/userInterface/creations/bloc/authentication/setup_profile_1/setup_profile_1_bloc.dart';
import 'controller/userInterface/creations/bloc/authentication/setup_profile_2/setup_profile_2.dart';
import 'controller/userInterface/creations/bloc/create_plan/channel_plan_bloc.dart';
import 'controller/userInterface/creations/bloc/create_plan/create_channel_bloc.dart';
import 'controller/userInterface/creations/bloc/create_plan/create_plan_bloc.dart';
import 'controller/userInterface/creations/bloc/splash/logo_controller_bloc/logo_bloc.dart';
import 'controller/userInterface/creations/bloc/user_verification/mobile_otp_bloc/mobile_otp_bloc.dart';
import 'controller/userInterface/creations/event/splash/logo_controller_evant/logo_event.dart';
import 'modal/country_state_city.dart';
import 'view/screen/creations/authentication/setup_profile_1.dart';
import 'view/screen/creations/authentication/setup_profile_3.dart';
import 'view/screen/creations/create_plan/pricing_plan.dart';
import 'view/utils/widget/bottam_navigation/channale_navigation.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   pref = await SharedPreferences.getInstance();

   //Mobile Number Authntication
   mobileNumber = pref!.getString('Mobile Number') ?? 'mobileNumber = {}';

   //Mobile Otp
   mobileOTP = pref!.getString('Mobile OTP') ?? 'Mobile OTP = {}';

   //Profile one
   name = pref!.getString('Name') ?? 'Name = {}';
   email = pref!.getString('Email') ?? 'Email = {}';
   about = pref!.getString('About') ?? 'About = {}';

   //Profile two
   selectedCountry_country = pref!.getString('selectedCountry') ?? 'country = {}';
   selectedState_state = pref!.getString('selectedState') ?? 'state = {}';
   selectedCity_city = pref!.getString('selectedCity') ?? 'city = {}';
   address_one = pref!.getString('address_one') ?? 'address_one = {}';
   address_two = pref!.getString('address_two') ?? 'address_two = {}';

   //Profile thard
   panCard = pref!.getString('Pan Card') ?? 'Pan Card = {}';
   panCardOTP = pref!.getString('Pan Card OTP') ?? 'Pan Card OTP = {}';
   aadharCard = pref!.getString('Aadhar Card') ?? 'Aadhar Card = {}';
   aadharOTP = pref!.getString('Aadhar OTP') ?? 'Aadhar OTP = {}';
   accountNumbar = pref!.getString('Account numbar') ?? 'Account numbar = {}';
   accountHolder = pref!.getString('Account holder') ?? 'Account holder = {} ';
   IFSC_code = pref!.getString('IFSC_code') ?? 'IFSC_code = {}';

   //create channale
   channel_name = pref!.getString('channel Name') ?? 'channel Name';
   About_you = pref!.getString('Abot you') ?? 'Abot you';

   //channel permission
   featureCount = pref!.getInt('feature_count') ?? 0;
   feature_list = pref!.getStringList('feature_list') ?? [];

   //Channal plan
   planAmount = pref!.getString('planAmount') ?? 'planAmount = {}';
   offerprice = pref!.getString('offerprice') ?? 'offerprice = {}';
   selectedDuration = pref!.getString('selectedDuration') ?? 'selectedDuration = {}';
   selectedDurationSecond = pref!.getString('selectedDurationSecond') ?? 'selectedDurationSecond = {}';


   islogin = pref!.getBool('login') ?? false;

   //print
   print('islogin = $islogin');


   // Mobile Number Authntication
   print('mobileNumber = ${mobileNumber}');

   //Mobile Otp
   print('Mobile OTP = ${mobileOTP}');

   //Profile one
   print('Name = ${name}');
   print('Email = ${email}');
   print('About = ${about}');

   //Profile two
   print('selectedCountry = $selectedCountry_country');
   print('selectedState = $selectedState_state');
   print('selectedCity = $selectedCity_city');
   print('address_one = $address_one');
   print('address_two = $address_two');

   //Profile thard
   print('Pan Card = $panCard');
   print('Pan Card OTP = $panCardOTP');
   print('Aadhar Card = $aadharCard');
   print('Aadhar OTP = $aadharOTP');
   print('Account numbar = $accountNumbar');
   print('Account holder = $accountHolder');
   print('IFSC_code = $IFSC_code');

   //create channale
   print('channel Name = $channel_name');
   print('Abot you = $About_you');

   //channel permission
   print('Saved feature count =  $featureCount');
   print('feature_list = $feature_list');

   //channale plan
   print('planAmount = $planAmount');
   print('offerprice = $offerprice');
   print('selectedDuration = $selectedDuration');
   print('selectedDurationSecond = $selectedDurationSecond');


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

        //channal plan
        BlocProvider(create: (_) => DurationCubit()),
      ],
      child: GetMaterialApp(
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
