// ignore_for_file: avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps
//   void checkLoginStatus() {
//   bool allFieldsPresent = pref!.getString('Mobile Number') != null &&
//       pref!.getString('Mobile OTP') != null &&
//       pref!.getString('Name') != null &&
//       pref!.getString('Email') != null &&
//       pref!.getString('About') != null &&
//       pref!.getString('selectedCountry') != null &&
//       pref!.getString('selectedState') != null &&
//       pref!.getString('selectedCity') != null &&
//       pref!.getString('address_one') != null &&
//       pref!.getString('address_two') != null &&
//       pref!.getString('Pan Card') != null &&
//       pref!.getString('Pan Card OTP') != null &&
//       pref!.getString('Aadhar Card') != null &&
//       pref!.getString('Aadhar OTP') != null &&
//       pref!.getString('Account numbar') != null &&
//       pref!.getString('Account holder') != null &&
//       pref!.getString('IFSC_code') != null;
//       pref!.getString('channel Name') != null &&
//       pref!.getString('Abot you') != null &&
//       pref!.getString('planAmount') != null &&
//       pref!.getString('offerprice') != null &&
//       pref!.getString('selectedDuration') != null &&
//       pref!.getString('selectedDurationSecond') != null;
//
//   islogin = allFieldsPresent;
//
//   print('Login status updated: islogin = $islogin');
// }

import '../../../view/utils/app_contrast.dart';

class LocalDatabase {

  //Mobile Autntication
  void mobileauthenticationnumber(rawNumber) {
    pref!.setString('Mobile Number', rawNumber);
    mobileNumber = pref!.getString('Mobile Number')!;

    print('Mobile Number');
    print('mobileNumber = $mobileNumber');
  }

  //Mobile Otp
  void mobileOtp(otp) {
    pref!.setString('Mobile OTP', otp);
    mobileOTP = otp;
    mobileOTP = pref!.getString('Mobile OTP')!;

    print('Mobile Otp');
    print('Mobile OTP = $otp');
  }

  //profile one
  void setup_profile_one(fullname_controller, email_controller, about_controller) {
    pref!.setString('Name', fullname_controller.text);
    pref!.setString('Email', email_controller.text);
    pref!.setString('About', about_controller.text);

    name = pref!.getString('Name')!;
    email = pref!.getString('Email')!;
    about = pref!.getString('About')!;

    print('setup Profile frist');
    print('Name = ${name}');
    print('Email = ${email}');
    print('About = ${about}');
  }

  //profile two
  //country
  void country(selectedCountry) {
    pref!.setString('selectedCountry', selectedCountry['Country']);

    selectedCountry_country = pref!.getString('selectedCountry')!;

    print('selectedCountry = ${selectedCountry['Country']}');
  }

  //state
  void state(selectedState) {
    pref!.setString('selectedState', selectedState['Name']);
    selectedState_state = pref!.getString('selectedState')!;

    print('selectedState = $selectedState_state');
  }

  //city
  void city(selected) {
    pref!.setString('selectedCity', selected['CityName']);
    selectedCity_city = pref!.getString('selectedCity')!;

    print('selectedCity = $selectedCity_city');
  }

  //adress one
  void addressone(text) {
    pref!.setString('address_one', text);
    address_one = pref!.getString('address_one')!;

    print('address_one = $address_one}');
  }

  void addresstwo(text) {
    pref!.setString('address_two', text);
    address_two = pref!.getString('address_two')!;
    print('address_two = $address_two}');
  }

  //profile thrad
  void setup_profile_thard_save(
      cardcontroller,
      cardcontroller_otp,Aadharcontroller,
      Aadharcardcontroller_otp,
      Account_numbar_controller,
      Account_holder_name,
      IFSC_code_controllr
      ) {
    pref!.setString('Pan Card', cardcontroller.text);
    pref!.setString('Pan Card OTP', cardcontroller_otp.text);
    pref!.setString('Aadhar Card', Aadharcontroller.text);
    pref!.setString('Aadhar OTP', Aadharcardcontroller_otp.text);
    pref!.setString('Account numbar', Account_numbar_controller.text);
    pref!.setString('Account holder', Account_holder_name.text);
    pref!.setString('IFSC_code', IFSC_code_controllr.text);

    panCard = pref!.getString('Pan Card')!;
    panCardOTP = pref!.getString('Pan Card OTP')!;
    aadharCard = pref!.getString('Aadhar Card')!;
    aadharOTP = pref!.getString('Aadhar OTP')!;
    accountNumbar = pref!.getString('Account numbar')!;
    accountHolder = pref!.getString('Account holder')!;
    IFSC_code = pref!.getString('IFSC_code')!;

    print('Pan Card = $panCard');
    print('Pan Card OTP = $panCardOTP');
    print('Aadhar Card = $aadharCard');
    print('Aadhar OTP = $aadharOTP');
    print('Account numbar = $accountNumbar');
    print('Account holder = $accountHolder');
    print('IFSC_code = $IFSC_code');
  }

  //create New Channle
  void create_channale(Channelcontroller,abouting_controller){
    pref!.setString('channel Name',Channelcontroller.text);
    pref!.setString('Abot you', abouting_controller.text);

    channel_name = pref!.getString('channel Name')!;
    About_you = pref!.getString('Abot you')!;

    print('channel Name = $channel_name');
    print('Abot you = $About_you');
  }

  //Channel plan
  void channalePlan(
      planAmountController,
      offerPriceController,
       {String? selectedDuration,
         String? selectedDurationSecond,
      }){
    pref!.setString('planAmount', planAmountController.text);
    pref!.setString('offerprice', offerPriceController.text);
    if (selectedDuration != null) {
      pref!.setString('selectedDuration',selectedDuration);
    }
    if (selectedDurationSecond != null) {
      pref!.setString('selectedDurationSecond', selectedDurationSecond);
    }

    islogin = true;

    print('islogin = $islogin');

    planAmount = pref!.getString('planAmount')!;
    offerprice = pref!.getString('offerprice')!;
    selectedDuration = pref!.getString('selectedDuration')!;
    selectedDurationSecond = pref!.getString('selectedDurationSecond')!;

    print('planAmount = $planAmount');
    print('planAmount = $offerprice');
    print('selectedDuration = $selectedDuration');
    print('selectedDurationSecond = $selectedDurationSecond');
  }

  void isLogins(){
    pref!.setBool('login', true);
    islogin = pref!.getBool('login') ?? false;
    print('...');
    print('login = $islogin');
    print('....');
  }

  void isLogout(){
    pref!.setBool('login', false);
    islogin = pref!.getBool('login') ?? true;
    pref!.clear();
    feature_list = [];
    print('feature_list = [] = $feature_list');
    print('...');
    print('login = $islogout');
    print('....');
  }
}
