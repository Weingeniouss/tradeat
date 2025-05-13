import 'dart:async';

abstract class MobileOTPEvent {}

class StartOtpTimer extends MobileOTPEvent {}

class Tick extends MobileOTPEvent {
  final int currentTime;
  Tick(this.currentTime);
}