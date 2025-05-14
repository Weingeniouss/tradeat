class MobileOtpState {
  final int start;

  MobileOtpState({required this.start});

  MobileOtpState copyWith({int? start}) {
    return MobileOtpState(start: start ?? this.start);
  }
}