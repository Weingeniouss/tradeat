// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, non_constant_identifier_names, unrelated_type_equality_checks, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/controller/database/loacl_store/local.dart';
import 'package:tradeat/view/screen/creations/create_plan/pricing_plan.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_contrast.dart';
import 'package:tradeat/view/utils/app_gif.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/button.dart';
import 'package:tradeat/view/utils/widget/card_verification.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/inputfield.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';
import '../../../utils/responsive.dart';
import '../../../utils/widget/authentication_appbar.dart';

class SetupProfile_thard extends StatefulWidget {
  const SetupProfile_thard({super.key});

  @override
  State<SetupProfile_thard> createState() => _SetupProfile_thardState();
}

class _SetupProfile_thardState extends State<SetupProfile_thard> {
  TextEditingController cardcontroller = TextEditingController();
  TextEditingController cardcontroller_otp = TextEditingController();

  TextEditingController Aadharcontroller = TextEditingController();
  TextEditingController Aadharcardcontroller_otp = TextEditingController();

  TextEditingController Account_numbar_controller = TextEditingController();
  TextEditingController Account_holder_name = TextEditingController();
  TextEditingController IFSC_code_controllr = TextEditingController();

  @override
  void initState() {
    super.initState();
    cardcontroller.addListener(updateButtonCondition);
    cardcontroller_otp.addListener(updateButtonCondition);

    Aadharcontroller.addListener(updateButtonCondition);

    Account_numbar_controller.addListener(updateButtonCondition);
    Account_holder_name.addListener(updateButtonCondition);
    IFSC_code_controllr.addListener(updateButtonCondition);
  }

  void updateButtonCondition() {setState(() {});}

  bool isFormValid() {return Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10;}
  bool pancardVerification() {return cardcontroller.text.length == 10;}
  bool AadharVerification() {return Aadharcontroller.text.length == 16;}

  ValueNotifier<double> progressNotifier = ValueNotifier<double>(0);
  bool isPanVerified = false;
  bool isAadharVerified = false;
  bool isbankVerified = false;

  void panVerification() {
    if (!isPanVerified) {
      isPanVerified = true;
      progressNotifier.value += 25;
      print("Progress updated: ${progressNotifier.value}");
    } else {
      print("Pan already verified. No update.");
    }
  }

  void aadharVerification() {
    if (!isAadharVerified) {
      isAadharVerified = true;
      progressNotifier.value += 25;
      print("Progress updated: ${progressNotifier.value}");
    } else {
      print("Pan already verified. No update.");
    }
  }

  void bankVerification() {
    if (!isbankVerified) {
      isbankVerified = true;
      progressNotifier.value += 50;
      print("Progress updated: ${progressNotifier.value}");
    } else {
      print("Pan already verified. No update.");
    }
  }

  bool isbankingcontainer = false;
  bool allset = false;

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    final responsivetext = responsive_text(context);
    return ValueListenableBuilder(
      valueListenable: progressNotifier,
      builder: (context, progressValue, _) {
        return Scaffold(
          appBar: authenticationAppBar(context: context, progress: progressValue),
          bottomNavigationBar: (Aadharcardcontroller_otp.text.length == 4 && cardcontroller_otp.text.length == 4 &&  Aadharcontroller.text.length == 16 && cardcontroller.text.length == 10 && Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10)

          //Button
              ? Container(
               height: size.height * 0.070,
                color: AppColor.black_color,
                child: Center(
                  child: horizontalPadding(
                    context: context,
                    child: Button(onTap: (){
                      if(Aadharcardcontroller_otp.text.length == 4 && cardcontroller_otp.text.length == 4 &&  Aadharcontroller.text.length == 16 && cardcontroller.text.length == 10 && Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10){
                        LocalDatabase().setup_profile_thard_save(cardcontroller, cardcontroller_otp, Aadharcontroller, Aadharcardcontroller_otp, Account_numbar_controller, Account_holder_name, IFSC_code_controllr);
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => PricingPlan(),
                            fullscreenDialog: true,
                            maintainState: true,
                            allowSnapshotting: true
                        ));
                      }
                      },context: context, buttonname: AppString.Next,buttoncondition: Aadharcardcontroller_otp.text.length == 4 && cardcontroller_otp.text.length == 4 &&  Aadharcontroller.text.length == 16 && cardcontroller.text.length == 10 && Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10),
                  ),
                ),
              )
              : SizedBox(),
          body: Container(
            width: size.width, height: size.height,
            decoration: BoxDecoration(color: AppColor.black_color),
            child: horizontalPadding(
              context: context,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: size.height / 60),

                          //Pan Verification
                          CardVerification(
                            onTap: () => panVerification(),
                            true_icons: AppIcon.pancard_true,
                            flase_icon: AppIcon.pancard,
                            hedingString: AppString.Pan,
                            cardnumber: AppString.Pan_Card_number,
                            otp_number: AppString.OTP,
                            cart_controller: cardcontroller,
                            cart_Otp_controller: cardcontroller_otp,
                            maxLength: 10,
                            buttoncondition: pancardVerification(),
                          ),

                          //Aadhar Verification
                          CardVerification(
                            onTap: () => aadharVerification(),
                            true_icons: AppIcon.pancard_true,
                            flase_icon: AppIcon.pancard,
                            hedingString: AppString.Aadhar,
                            cardnumber: AppString.hint_Aadhar_Card_number,
                            otp_number: AppString.OTP,
                            cart_controller: Aadharcontroller,
                            cart_Otp_controller: Aadharcardcontroller_otp,
                            maxLength: 16,
                            buttoncondition: Aadharcontroller.text.length == 16,
                          ),

                          //Bank Details
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isbankingcontainer = !isbankingcontainer;
                              });
                              },
                            child: AnimatedContainers(
                              context: context,
                              child: SingleChildScrollView(
                                child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: size.width / 1.5,
                                            child: Row(
                                              children: [
                                                (allset)
                                                    ? SvgPicture.asset(AppIcon.banck_true)
                                                    : SvgPicture.asset(AppIcon.bank,
                                                    color: (isbankingcontainer)
                                                        ? AppColor.white_color
                                                        : AppColor.other_text_color),
                                                  SizedBox(width: size.width / 50),
                                                  Text(AppString.Bank_Details,
                                                      style: TextStyle(
                                                        color: (isbankingcontainer)
                                                            ? AppColor.white_color
                                                            : AppColor.other_text_color,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: responsivetext.value,
                                                      ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            AnimatedSwitcher(
                                              duration: Duration(milliseconds: 300),
                                              transitionBuilder: (child, animation) {
                                                return RotationTransition(
                                                  turns: Tween(begin: 0.75, end: 1.0).animate(animation),
                                                  child: FadeTransition(opacity: animation, child: child,
                                                  ),
                                                );
                                              },
                                              child: SvgPicture.asset(
                                                (isbankingcontainer)
                                                    ? AppIcon.up
                                                    : AppIcon.down,
                                                key: ValueKey(isbankingcontainer),
                                                color: (isbankingcontainer)
                                                    ? null
                                                    : AppColor.other_text_color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        AnimatedSwitcher(
                                          duration: Duration(milliseconds: 300),
                                          child: (isbankingcontainer)
                                              ? SizedBox(height: size.height / 150)
                                              : SizedBox(),
                                        ),
                                        AnimatedSwitcher(
                                          duration: Duration(milliseconds: 800),
                                          child: (isbankingcontainer)
                                              ? Divider(color: AppColor.textfield_color_2)
                                              : SizedBox(),
                                        ),
                                        AnimatedSwitcher(
                                          duration: Duration(seconds: 1),
                                          child: (isbankingcontainer) ? Column(
                                            children: [
                                              SizedBox(height: size.height / 80),
                                              inputfield(maxLength: 13, keyboardType: TextInputType.number, context: context, hintText: AppString.hintAccount, text: AppString.Account_Number, controller: Account_numbar_controller),
                                              SizedBox(height: size.height / 80),
                                              inputfield(keyboardType: TextInputType.name, context: context, hintText: AppString.hintAccount_Holder_Name, text: AppString.Account_Holder_Name, controller: Account_holder_name),
                                              SizedBox(height: size.height / 80),
                                              inputfield(maxLength: 10, context: context, hintText: AppString.hintIFSC_Code, text: AppString.IFSC_Code, controller: IFSC_code_controllr),
                                              SizedBox(height: size.height / 80),
                                              Button(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContextcontext) {
                                                        Future.delayed(Duration(seconds: 2), () {
                                                          Navigator.pop(context);
                                                          bankVerification();
                                                          allset = true;
                                                          isbankingcontainer = false;
                                                        });
                                                        return AlertDialog(
                                                          backgroundColor: AppColor.white_color,
                                                          elevation: 0,
                                                          content: Container(
                                                            height: size.height / 15,
                                                            width: size.width,
                                                            decoration: BoxDecoration(color: AppColor.white_color),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(AppGif.loader),
                                                                SizedBox(width: size.width / 40),
                                                                Text(AppString.Please_Wait, style: TextStyle(fontSize: responsivetext.value, fontWeight: FontWeight.w700)),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                      },
                                                context: context,
                                                buttonname: AppString.Save,
                                                buttoncondition: isFormValid(),
                                              ),
                                            ],
                                          ) : SizedBox(),
                                        ),
                                      ],
                                    ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  // (Aadharcardcontroller_otp.text.length == 4 && cardcontroller_otp.text.length == 4 &&  Aadharcontroller.text.length == 16 && cardcontroller.text.length == 10 && Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10)
                  //     ? Button(onTap: (){
                  //        if(Aadharcardcontroller_otp.text.length == 4 && cardcontroller_otp.text.length == 4 &&  Aadharcontroller.text.length == 16 && cardcontroller.text.length == 10 && Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10){
                  //          Navigator.push(context, MaterialPageRoute(builder: (context) => PricingPlan(), fullscreenDialog: true, maintainState: true, allowSnapshotting: true));
                  //        }
                  //      },context: context, buttonname: AppString.Next,buttoncondition: Aadharcardcontroller_otp.text.length == 4 && cardcontroller_otp.text.length == 4 &&  Aadharcontroller.text.length == 16 && cardcontroller.text.length == 10 && Account_numbar_controller.text.isNotEmpty && Account_numbar_controller.text.length == 13 && Account_holder_name.text.isNotEmpty && IFSC_code_controllr.text.isNotEmpty && IFSC_code_controllr.text.length == 10)
                  //     : SizedBox(),
                  SizedBox(height: size.height / 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
