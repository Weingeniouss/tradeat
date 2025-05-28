import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../event/authentication/setup_profile_1_event/setup_mobile_number_event.dart';
import '../../../state/authentication/setup_profile_1/setup_profile_1_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
 final double progressStep = 25;

  ProfileBloc() : super(ProfileState()) {
    on<PickImageEvent>(_onPickImage);
    on<AboutTextChangedEvent>(_onAboutTextChanged);
    on<NameEnteredEvent>(_onNameEntered);
    on<EmailEnteredEvent>(_onEmailEntered);
  }

  Future<void> _onPickImage(PickImageEvent event, Emitter<ProfileState> emit) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null && !state.isPhotoAdded) {
      emit(state.copyWith(
        image: File(pickedImage.path),
        progress: state.progress + progressStep,
        isPhotoAdded: true,
      ));
    }
  }

  void _onAboutTextChanged(AboutTextChangedEvent event, Emitter<ProfileState> emit) {
  final newLength = event.aboutText.trim().length;

  if (newLength > 0 && !state.isAboutAdded) {
    emit(state.copyWith(
      charCount: newLength,
      progress: state.progress + progressStep,
      isAboutAdded: true,
    ));
  } else if (newLength == 0 && state.isAboutAdded) {
    emit(state.copyWith(
      charCount: newLength,
      progress: state.progress - progressStep,
      isAboutAdded: false,
    ));
  } else {
    // Only update charCount if no progress change is needed
    emit(state.copyWith(charCount: newLength));
  }
}

  void _onNameEntered(NameEnteredEvent event, Emitter<ProfileState> emit) {
  final name = event.name.trim();

  if (name.isNotEmpty && name.length >= 4 && !state.isNameAdded) {
    emit(state.copyWith(
      progress: state.progress + progressStep,
      isNameAdded: true,
    ));
  } else if ((name.isEmpty || name.length < 4) && state.isNameAdded) {
    emit(state.copyWith(
      progress: state.progress - progressStep,
      isNameAdded: false,
    ));
  }
}

  void _onEmailEntered(EmailEnteredEvent event, Emitter<ProfileState> emit) {
  final email = event.email.trim();

  if (email.isNotEmpty && email.length >= 10 && !state.isEmailAdded) {
    emit(state.copyWith(
      progress: state.progress + progressStep,
      isEmailAdded: true,
    ));
  } else if ((email.isEmpty || email.length < 10) && state.isEmailAdded) {
    emit(state.copyWith(
      progress: state.progress - progressStep,
      isEmailAdded: false,
    ));
  }
}
}