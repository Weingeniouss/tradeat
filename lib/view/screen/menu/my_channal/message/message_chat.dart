// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tradeat/view/screen/menu/my_channal/message/sent_message_chat.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/loder.dart';
import '../../../../../modal/chat_message.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/widget/Search.dart';
import '../../../../utils/widget/authentication_appbar.dart';
import '../../../../utils/widget/horizontal_padding.dart';

class MessageChat extends StatefulWidget {
  const MessageChat({super.key});

  @override
  State<MessageChat> createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {
  TextEditingController Searchmassage = TextEditingController();

  List<Map<String, dynamic>> originalChat = []; // Original chat data
  List<Map<String, dynamic>> filteredChat = []; // Filtered results
  Timer? _debounceTimer;

  @override
  void initState() {
    originalChat = chat.toList().cast<Map<String, dynamic>>();
    filteredChat = List.from(originalChat);
    super.initState();
  }

  void filterChats(String Query) {
    setState(() {
      if (Query.isEmpty) {
        filteredChat = List.from(originalChat);
      } else {
        filteredChat = originalChat.where((chat) {
          return chat['name'].toLowerCase().contains(Query.toLowerCase());
        }).toList();
      }
    });
  }

  void onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel(); // Cancel previous timer if active
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      filterChats(query);
    });
  }


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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: size.height, width: size.width,
                decoration: BoxDecoration(color: AppColor.black_color),
                child: Center(child: LodingState(context)),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: size.width, height: size.height,
              decoration: BoxDecoration(color: AppColor.black_color),
              child: horizontalPadding(
                context: context,
                child: Column(
                  children: [

                    //Sarch of Membars
                    SizedBox(height: size.height / 50),
                    searchBar(context: context, controller: Searchmassage, onChanged: onSearchChanged),
                    SizedBox(height: size.height / 50),

                    //List of Mambar
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredChat.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) {
                                  return SentMessageChat(image: chat[index]['image'], text: filteredChat[index]['name'],);
                                }),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: size.width / 40),
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
                                            Text(filteredChat[index]['name'], style: TextStyle(color: AppColor.white_color, fontSize: size.width / 26, fontWeight: FontWeight.w600)),
                                            SizedBox(height: size.height / 150),
                                            Text(
                                              filteredChat[index]['undermassage'],
                                              style: TextStyle(color: AppColor.other_text_color, fontSize: size.width / 28),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: size.width / 20,
                                          height: size.height / 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                AppColor.yellow_color,
                                                AppColor.orange_color,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              filteredChat[index]['messagecount'],
                                              style: TextStyle(fontSize: size.width / 35, fontWeight: FontWeight.w600),
                                            ),
                                          ), // Closed icon
                                        ),
                                        SizedBox(height: size.height / 150),
                                        Text(filteredChat[index]['time'], style: TextStyle(color: AppColor.other_text_color)),
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
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Text('No Data Sorry !', style: TextStyle(color: AppColor.other_text_color));
          }
          return SizedBox();
        },
      ),
    );
  }
}
