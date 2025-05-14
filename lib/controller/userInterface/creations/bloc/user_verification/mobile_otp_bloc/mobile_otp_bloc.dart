// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../event/user_verification/mobile_otp_event/mobile_otp_event.dart';
import '../../../state/user_verification/mobile_otp_state/mobile_otp_state.dart';


class MobileOtpBloc extends Bloc<MobileOTPEvent, MobileOtpState> {
  Timer? _timer;

  MobileOtpBloc() : super(MobileOtpState(start: 30)) {
    on<StartOtpTimer>((event, emit) {
      _timer?.cancel();
      int start = 30;
      emit(state.copyWith(start: start));

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (start == 0) {
          _timer?.cancel();
        } else {
          start--;
          add(Tick(start));
        }
      });
    });

    on<Tick>((event, emit) {
      emit(state.copyWith(start: event.currentTime));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
