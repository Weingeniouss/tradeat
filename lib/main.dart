// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradeat/controller/userInterface/bloc/logo_controller_bloc/logo_bloc.dart';
import 'package:tradeat/controller/userInterface/event/logo_controller_evant/logo_event.dart';
import 'package:tradeat/view/screen/splace/logo.dart';

import 'controller/userInterface/bloc/auth_mobile_number_bloc/Auth_mobile_number_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // login page
        BlocProvider(create: (BuildContext context) => SplashBloc()..add(SplashStarted())),

        // phone Number page
        BlocProvider(create: (BuildContext context)  => AuthMobileNumberBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: Logo(),
      ),
    );
  }
}
