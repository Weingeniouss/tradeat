// ignore_for_file: empty_constructor_bodies, file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradeat/controller/userInterface/state/auth_Mobile_number_stateController/auth_Mobile_number_stateController.dart';

import '../../event/auth_mobile_number_controller/auth_mobile_number__event.dart';

class AuthMobileNumberBloc extends Bloc<AuthMobileNumberEvent, AuthMobileNumberState> {
  AuthMobileNumberBloc() : super(AuthMobileNumberState()) {
    on<MobileNumberChanged>((event, emit) {
      emit(state.copyWith(mobileNumber: event.mobileNumber));
    });

    on<TermsAcceptedChanged>((event, emit) {
      emit(state.copyWith(isAccepted: event.isAccepted));
    });

    on<DialCodeChanged>((event, emit) {
  emit(state.copyWith(selectedDialCode: event.dialCode));
});
  }
}