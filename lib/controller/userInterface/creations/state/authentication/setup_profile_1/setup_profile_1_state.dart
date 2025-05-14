import 'dart:io';

class ProfileState {
  final File? image;
  final int charCount;
  final int maxLength;
  final double progress;
  final bool isPhotoAdded;
  final bool isNameAdded;
  final bool isEmailAdded;
  final bool isAboutAdded;


  ProfileState({this.maxLength = 100, this.image, this.charCount = 0, this.progress = 0, this.isPhotoAdded = false, this.isNameAdded = false, this.isEmailAdded = false, this.isAboutAdded = false,});

  ProfileState copyWith({File? image, int? maxLength, int? charCount, double? progress, bool? isPhotoAdded, bool? isNameAdded, bool? isEmailAdded, bool? isAboutAdded,}) {
    return ProfileState(
      image: image ?? this.image,
      charCount: charCount ?? this.charCount,
      maxLength: maxLength ?? this.maxLength,
      progress: progress ?? this.progress,
      isPhotoAdded: isPhotoAdded ?? this.isPhotoAdded,
      isNameAdded: isNameAdded ?? this.isNameAdded,
      isEmailAdded: isEmailAdded ?? this.isEmailAdded,
      isAboutAdded: isAboutAdded ?? this.isAboutAdded,
    );
  }
}