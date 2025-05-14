// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/screen/creations/authentication/auth_mobile_number.dart';
import 'package:tradeat/view/utils/app_gif.dart';
import 'package:tradeat/view/utils/app_image.dart';
import 'package:tradeat/view/utils/app_logo.dart';
import '../../../controller/userInterface/creations/bloc/splash/logo_controller_bloc/logo_bloc.dart';
import '../../../controller/userInterface/creations/state/splash/logo_controller_state/logo_state.dart';
import '../../utils/widget/app_size.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (BuildContext context, state) {
        if (state is SplashNavigate) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthMobileNumber()));
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Container(
            width: size.width, height: size.height,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppImage.background), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Column(
                  children: [
                    SizedBox(height: size.height / 30),
                    SvgPicture.asset(AppLogo.logo),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(AppGif.loader, width: 50, height: 50),
                    SizedBox(height: size.height / 30),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
