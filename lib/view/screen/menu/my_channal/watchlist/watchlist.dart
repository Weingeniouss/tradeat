// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, text_direction_code_point_in_literal

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import 'package:tradeat/view/utils/widget/profile_container.dart';
import '../../../../utils/app_icon.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/widget/authentication_appbar.dart';
import '../../../../utils/widget/shadermask.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {

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
      appBar: simpaleaapbar(context, text: AppString.watchlist, icons: AppIcon.left),
      body: Container(
        width: size.width, height: size.height,
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
                      child: (subindexone == 1)
                          ? Shadermask(context: context, text: AppString.watchlist,fontSize: size.width / 27)
                          : Text(AppString.watchlist, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w500, fontSize: size.width / 27)),
                      ),
                      SvgPicture.asset(AppIcon.line),
                      Text(AppString.watchlist1, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w500, fontSize: size.width / 27)),
                      SvgPicture.asset(AppIcon.line),
                      Text(AppString.watchlist1, style: TextStyle(color: AppColor.other_text_color, fontWeight: FontWeight.w500, fontSize: size.width / 27)),
                    ],
                  ),
                ),
              SizedBox(height: size.height / 50),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileContainer(
                      margin: EdgeInsets.symmetric(vertical: size.height / 100),
                      context: context,
                      padding: EdgeInsets.all(20),
                      Widget: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Shadermask(context: context, text: 'Maruti Suzuki',fontSize: size.width / 24),
                              Text('₹11,000.50',style: TextStyle(color: AppColor.white_color,fontSize: size.width / 30,fontWeight: FontWeight.w500))
                            ],
                          ),
                          SizedBox(height: size.height / 110),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('NSE',style: TextStyle(fontSize: size.width / 30,color: AppColor.other_text_color)),
                              Text('290.4‬ (2.64%)',style: TextStyle(color: AppColor.Lgreen_color,fontSize: size.width / 30,fontWeight: FontWeight.w500))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
