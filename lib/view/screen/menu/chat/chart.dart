// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tradeat/modal/chat_message.dart';
import 'package:tradeat/view/screen/menu/chat/sent_message.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/loder.dart';

import '../../../utils/app_string.dart';
import '../../../utils/widget/authentication_appbar.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(
        context,
        text: AppString.Messages,
        subIcons: Container(
          width: size.width / 10, height: size.height / 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColor.yellow_color, AppColor.orange_color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Icon(Icons.add, size: 25), // Closed icon
        ),
      ),
      body: FutureBuilder(
        future: fetchChats(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              body: Container(
                width: size.width, height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: LodingState(context)),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: horizontalPadding(
            context: context,
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SentMessage(
                            text: chat[index]['name'],
                            image: chat[index]['image'],
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: size.width / 40),
                    width: size.width / 20,
                    height: size.height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                      color: AppColor.textfield_color,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size.width / 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 30, backgroundImage: AssetImage(chat[index]['image'])),
                              SizedBox(width: size.width / 40),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chat[index]['name'], style: TextStyle(color: AppColor.white_color, fontSize: size.width / 26, fontWeight: FontWeight.w600)),
                                  SizedBox(height: size.height / 150),
                                  Text(chat[index]['undermassage'], style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 28)),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: size.width / 20, height: size.height / 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColor.yellow_color,
                                      AppColor.orange_color
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Center(child: Text(chat[index]['messagecount'], style: TextStyle(fontSize: size.width / 35, fontWeight: FontWeight.w600))), // Closed icon
                              ),
                              SizedBox(height: size.height / 150),
                              Text(chat[index]['time'], style: TextStyle(color: AppColor.other_text_color)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
          }
          if(snapshot.hasError){
            return Scaffold(
              body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: Text('Sorry !',style: TextStyle(color: AppColor.white_color,fontSize: size.width / 26))),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
