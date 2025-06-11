// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tradeat/view/screen/menu/my_channal/signal/toggle/toggle_tab.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/authentication_appbar.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';

import '../../../../../../modal/equity_list.dart';
import '../../../../../utils/widget/Search.dart';

class Equity extends StatefulWidget {
  const Equity({super.key});

  @override
  State<Equity> createState() => _EquityState();
}

class _EquityState extends State<Equity> {
   TextEditingController searchController = TextEditingController();
   List<Map<String, String>> filteredEquityList = [];

   @override
   void initState() {
     super.initState();
     filteredEquityList = List.from(Equity_list);
   }

  void filterEquityList(String query) {
    final lowerQuery = query.toLowerCase();

    final results = Equity_list.where((element) {
     final name = element['name']?.toLowerCase() ?? '';
     final equity = element['equity']?.toLowerCase() ?? '';

     return name.contains(lowerQuery) || equity.contains(lowerQuery);
   }).toList().cast<Map<String, String>>();

    setState(() {
      filteredEquityList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return Scaffold(
      appBar: simpaleaapbar(context, icons: AppIcon.left, text: AppString.DailyTradingTips),
      body: Container(
        width: size.width, height: size.height,
        decoration: BoxDecoration(color: AppColor.black_color),
        child: horizontalPadding(
          context: context,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height / 80),
                searchBar(context: context, controller: searchController, onChanged: filterEquityList),
                SizedBox(height: size.height / 50),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.RecentSearch, style: TextStyle(fontSize: size.width / 25, color: AppColor.other_text_color)),
                      SizedBox(height: size.height / 50),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true, scrollDirection: Axis.vertical, itemCount: filteredEquityList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final equitylist = filteredEquityList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ToggleTab(
                                  stockname: equitylist['equity']!,
                                  stock_name: equitylist['stock_name']!,
                                  name: equitylist['name']!,
                                  equity_cuurrunt: equitylist['equity_cuurrunt']!,
                                  profite: equitylist['profite']!,
                                  Open: equitylist['Open']!,
                                  High: equitylist['High']!,
                                  Low: equitylist['Low']!,
                                  Prev_Close: equitylist['Prev. Close']!,
                                  stock: equitylist['stock']!,
                                );
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: size.height / 90),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(equitylist['name']!, style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 28)),
                                          Text(equitylist['equity']!, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 25)),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 23,vertical: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.circular(size.width / 25),
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColor.orange_color, AppColor.yellow_color,
                                            ],
                                            begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(AppString.NSE,style: TextStyle(fontSize: size.width / 28,fontWeight: FontWeight.w600)),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: size.height / 80),
                                  Divider(color: AppColor.gray_color),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
