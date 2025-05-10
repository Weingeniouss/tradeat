// ignore_for_file: camel_case_types

abstract class AuthMobileNumberEvent {}

class MobileNumberChanged extends AuthMobileNumberEvent {
  final String mobileNumber;
  MobileNumberChanged(this.mobileNumber);
}

class TermsAcceptedChanged extends AuthMobileNumberEvent {
  final bool isAccepted;
  TermsAcceptedChanged(this.isAccepted);
}

class DialCodeChanged extends AuthMobileNumberEvent {
  final String dialCode;
  DialCodeChanged(this.dialCode);
}