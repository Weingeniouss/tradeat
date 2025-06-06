// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/loder.dart';
import '../../../utils/app_string.dart';
import '../../../utils/widget/authentication_appbar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context,text: AppString.Account),
      body: FutureBuilder(
        future: fetchChats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: LodingState(context)),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
          width: size.width, height: size.height,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: horizontalPadding(
            context: context,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  //Name And Email Id
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.textfield_color,
                      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('asset/image/image_8.jpeg'),
                          ),
                          SizedBox(width: size.width / 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Kheamesh Soni',style: TextStyle(fontSize: size.width / 27,color: AppColor.white_color,fontWeight: FontWeight.w600)),
                              Text('Kheameshsoni@gmail.com',style: TextStyle(color: AppColor.other_text_color)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 50),

                  //Do More With TradeAT
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.textfield_color,
                      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.DoMore,style: TextStyle(fontSize: size.width / 25,color: AppColor.white_color,fontWeight: FontWeight.w600)),
                        SizedBox(height: size.height / 50),
                        reporting(context,icons: AppIcon.taxreport, text: AppString.Tax), space(context),
                        reporting(context,icons: AppIcon.myHighlights, text: AppString.MyHighlights), space(context),
                        reporting(context,icons: AppIcon.fixedincome, text: AppString.FixedIncome),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 50),

                  //Account
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.textfield_color,
                      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.account,style: TextStyle(color: AppColor.white_color,fontSize: size.width / 25,fontWeight: FontWeight.w600)),
                        SizedBox(height: size.height / 50),
                        reporting(context,icons: AppIcon.myTradeATprofile, text: AppString.MyTradeATProfile), space(context),
                        reporting(context,icons: AppIcon.linkedbankaccount, text: AppString.LinkedBankAccount),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 50),

                  //Preferences
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.textfield_color,
                      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.Preferences,style: TextStyle(color: AppColor.white_color,fontSize: size.width / 25,fontWeight: FontWeight.w600)),
                        SizedBox(height: size.height / 50),
                        reporting(context,icons: AppIcon.setting, text: AppString.DeviceManager), space(context),
                        reporting(context,icons: AppIcon.familyaccount, text: AppString.FamilyAccount), space(context),
                        reporting(context,icons: AppIcon.setting, text: AppString.Settings), space(context),
                        reporting(context,icons: AppIcon.policies_agreements, text: AppString.PoliciesAgreements),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 50),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.textfield_color,
                      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    ),
                    child: reporting(context,icons: AppIcon.logout, text: AppString.Logout),
                  ),
                ],
              ),
            ),
          ),
        );
          }
          if(snapshot.hasError){
            return Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: Center(child: Text('Sorry !',style: TextStyle(color: AppColor.white_color))),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

Widget reporting(context,{required String icons, required String text}){
  final size = AppSize(context);
  return Row(
    children: [
      SvgPicture.asset(icons),
      SizedBox(width: size.width / 30),
      Text(text,style: TextStyle(color: AppColor.white_color,fontSize: size.width / 27)),
    ],
  );
}

Widget space(context){
  final size = AppSize(context);
  return Column(
    children: [
      SizedBox(height: size.height / 100),
      Divider(color: AppColor.other_text_color),
      SizedBox(height: size.height / 100),
    ],
  );
}