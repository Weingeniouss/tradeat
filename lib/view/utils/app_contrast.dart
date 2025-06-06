// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

// ! Local Data Store !
SharedPreferences? pref;

bool islogin = false;

//Mobile Number Authentication
String mobileNumber = '';

//Mobile Otp
String mobileOTP = '';

//profile one
String name = '';
String email = '';
String about = '';

//profile two
String selectedCountry_country = '';
String selectedState_state = '';
String selectedCity_city = '';
String address_one = '';
String address_two = '';

//profile thard
String panCard = '';
String panCardOTP = '';
String aadharCard = '';
String aadharOTP = '';
String accountNumbar = '';
String accountHolder = '';
String IFSC_code = '';

//create Channel
String channel_name = '';
String About_you = '';

//channale permission
String permission = '';

//channale permission
int featureCount = 0;
List feature_list = [];

//channal plan
String planAmount = '';
String offerprice = '';
String? selectedDuration = '';
String? selectedDurationSecond = '';
