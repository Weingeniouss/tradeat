// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../event/logo_controller_evant/logo_event.dart';
import '../../state/logo_controller_state/logo_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      await Future.delayed(Duration(seconds: 2)); 
      emit(SplashNavigate());
    });
  }
}