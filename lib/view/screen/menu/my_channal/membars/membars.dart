// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';

import '../../../../../modal/chat_message.dart';
import '../../../../utils/widget/shadermask.dart';

class Membars extends StatefulWidget {
  const Membars({super.key});

  @override
  State<Membars> createState() => _MembarsState();
}

class _MembarsState extends State<Membars> {
  int subindexone = 1;
  int subindextwo = 2;
  int subindexthree = 3;

  void subindex_fuction() {
    setState(() {
      subindexone = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context, text: AppString.Members, icons: AppIcon.left),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: horizontalPadding(
          context: context,
          child: Column(
            children: [
              SizedBox(height: size.height / 80),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.textfield_color,
                  borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => subindex_fuction(),
                      child: (subindexone == 1) ? Shadermask(context: context, text: AppString.ActiveUser,fontSize: size.width / 27) :Text(AppString.ActiveUser, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w500, fontSize: size.width / 27)),
                    ),
                    Text(AppString.NewUser, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w500, fontSize: size.width / 27)),
                    Text(AppString.BlockUser, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w500, fontSize: size.width / 27)),
                  ],
                ),
              ),
              SizedBox(height: size.height / 50),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                    color: AppColor.textfield_color, // optional background
                  ),
                  child: ListView.builder(
                    itemCount: chat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height / 150),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(radius: 25,backgroundImage: AssetImage(chat[index]['image'])),
                                SizedBox(width: size.width / 25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chat[index]['name'],
                                      style: TextStyle(
                                        fontSize: size.width / 26,
                                        color: AppColor.white_color,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                         Text(
                                          'Subscribed : ',
                                          style: TextStyle(
                                            fontSize: size.width / 30,
                                            color: AppColor.other_text_color,
                                          ),
                                        ),
                                        Text(
                                          chat[index]['Subscribed'],
                                          style: TextStyle(
                                            fontSize: size.width / 30,
                                            color: AppColor.other_text_color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: size.height / 150),
                            Divider(color: AppColor.gray_color),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
