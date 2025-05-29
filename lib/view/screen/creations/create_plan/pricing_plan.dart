// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tradeat/controller/userInterface/creations/bloc/create_plan/create_plan_bloc.dart';
import 'package:tradeat/controller/userInterface/creations/state/create_plan/create_plan_state.dart';
import 'package:tradeat/modal/price_tag.dart';
import 'package:tradeat/view/screen/creations/create_plan/create_channel.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/button.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../../controller/userInterface/creations/event/create_plan/create_plan_event.dart';
import '../../../utils/widget/authentication_appbar.dart';

class PricingPlan extends StatelessWidget {
  const PricingPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    bool buttoncondition = true;
    return Scaffold(
      appBar: authenticationprice(context: context),
      body: BlocBuilder<PricingBloc,PricingState>(
        builder: (BuildContext context, state) {
          int activeIndex = 0;
          if (state is PricingInitial) {
            activeIndex = state.currentIndex;
          }
          return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: AppColor.black_color),
          child: Column(
            children: [
              SizedBox(height: size.height / 50),
              CarouselSlider(
                  items: [
                    add_Container(context: context, Month: AppString.Monthly_500,button: Button(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateChannel()));
                    } ,context: context, buttonname: AppString.Subscribe, buttoncondition: buttoncondition)),
                    add_Container(context: context, Month: AppString.Monthly_1000,button: Button(context: context, buttonname: AppString.Subscribe, buttoncondition: buttoncondition)),
                    add_Container(context: context, Month: AppString.Monthly_5000,button: Button(context: context, buttonname: AppString.Subscribe, buttoncondition: buttoncondition)),
                  ],
                  options: CarouselOptions(
                      reverse: false,
                      enableInfiniteScroll: false,
                      height: size.height / 1.5,
                      onPageChanged: (index, reason) =>  context.read<PricingBloc>().add(PricingIndexChanged(index)),
                  ),
              ),
              SizedBox(height: size.height / 50),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [AppColor.yellow_color, AppColor.orange_color],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcIn,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 8,
                    dotColor: Colors.grey.withOpacity(0.3),
                    activeDotColor: AppColor.white_color,
                  ),
                  activeIndex: activeIndex,
                ),
              ),
            ],
          ),
        );
        },
      ),
    );
  }
}

Widget add_Container({required BuildContext context, required String Month,Widget? button}) {
  final size = AppSize(context);
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width / 50),
      height: size.height / 1.5, width: size.width,
      decoration: BoxDecoration(color: AppColor.textfield_color, borderRadius: BorderRadiusDirectional.circular(size.width / 25)),
      child: horizontalPadding(
        context: context,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height / 50),
            SvgPicture.asset(AppIcon.price),
            SizedBox(height: size.height / 80),
            Text(AppString.Month, style: TextStyle(fontSize: size.width / 25, fontWeight: FontWeight.w600, color: AppColor.white_color)),
            SizedBox(height: size.height / 80),
            Text(Month, style: TextStyle(fontSize: size.width / 22, color: AppColor.white_color, fontWeight: FontWeight.w600)),
            SizedBox(height: size.height / 80),
            Expanded(
              child: ListView.builder(
                  itemCount: price.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height / 50),
                        SizedBox(
                          width: size.width / 1.5,
                          child: Row(
                            children: [
                              Container(
                                width: 10, height: 10,
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
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.transparent,
                                  child: null,
                                ),
                              ),
                              SizedBox(width: size.width / 40),
                              Text(price[index], style: TextStyle(color: AppColor.white_color, fontSize: size.width / 26)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            button!,
            SizedBox(height: size.height / 50),
          ],
        ),
      ),
    );
    },
  );
}
