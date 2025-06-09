// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/loder.dart';
import '../../../utils/app_string.dart';
import '../../../utils/widget/authentication_appbar.dart';

class SentMessage extends StatefulWidget {
  final String image; final String text;

  const SentMessage({super.key, required this.image, required this.text});

  @override
  State<SentMessage> createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {
  TextEditingController massageset = TextEditingController();

  Future? _timeing;

  @override
  void initState() {
    _timeing = fetchChats();
    super.initState();
  }

  List<String>allmassage = [];

void setmassageval() {
  String msg = massageset.text.replaceAll(RegExp(r'\s+'), '');
  if (msg.isNotEmpty) {
    setState(() {
      allmassage.add(massageset.text.trim());
    });
    massageset.clear();
  } else {
    print("Empty message blocked.");
  }
}

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return FutureBuilder(
      future: _timeing,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            body: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: LodingState(context),
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return Scaffold(
        appBar: simpaleaapbar(context, text: widget.text, icons: AppIcon.left, image: widget.image),
        body: Container(
          width: size.width, height: size.height,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: Column(
            children: [

              //List of show Message
              Expanded(
                flex: 5, child: horizontalPadding(
                  context: context,
                  child: verticalPadding(
                    context: context,
                    child: ListView.builder(
                      reverse: true,
                      itemCount: allmassage.length,
                      itemBuilder: (context, index) {
                        int reversedIndex = allmassage.length - 1 - index;
                        return Padding(
                          padding: EdgeInsets.only(left: size.width / 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(size.width / 40),
                              margin: EdgeInsets.symmetric(vertical: size.width / 50),
                              decoration: BoxDecoration(
                                color: AppColor.massage_color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.width / 25),
                                  topRight: Radius.circular(size.width / 25),
                                  bottomLeft: Radius.circular(size.width / 25),
                                ),
                              ),
                              child: Text(allmassage[reversedIndex], style: TextStyle(fontSize: size.width / 25, color: AppColor.white_color)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              //InputMassage
              Expanded(
                flex: 1, child: Container(
                  width: size.width, height: size.height / 10,
                  decoration: BoxDecoration(color: AppColor.black_color),
                  child: horizontalPadding(
                    context: context,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width / 1.5, height: size.height / 14,
                          decoration: BoxDecoration(
                            color: AppColor.textfield_color,
                            borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width / 25),
                              child: TextField(
                                cursorColor: AppColor.white_color,
                                controller: massageset,
                                style: TextStyle(color: AppColor.white_color),
                                decoration: InputDecoration(
                                  hintText: AppString.Write,
                                  hintStyle: TextStyle(color: AppColor.other_text_color),
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setmassageval(),
                          child: Container(
                            width: size.width / 7, height: size.height / 14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.yellow_color,
                                  AppColor.orange_color,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Center(child: SvgPicture.asset(AppIcon.send)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
              child: Center(child: Text('Sorry !',style: TextStyle(color: AppColor.white_color))),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
