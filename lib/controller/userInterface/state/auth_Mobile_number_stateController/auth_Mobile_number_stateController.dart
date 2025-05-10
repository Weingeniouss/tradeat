// ignore_for_file: file_names, camel_case_types

class AuthMobileNumberState {
  final String mobileNumber;
  final bool isAccepted;
  final String selectedDialCode;

  AuthMobileNumberState({this.mobileNumber = '', this.isAccepted = false, this.selectedDialCode = '+91'});

  AuthMobileNumberState copyWith({String? mobileNumber, bool? isAccepted, String? selectedDialCode}) {
    return AuthMobileNumberState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      isAccepted: isAccepted ?? this.isAccepted,
      selectedDialCode: selectedDialCode ?? this.selectedDialCode,
    );
  }
}