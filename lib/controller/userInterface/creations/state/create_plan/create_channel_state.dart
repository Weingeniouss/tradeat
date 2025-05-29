class ChannelState {
  final String aboutText;
  final String channelText;
  final bool isValid;

  ChannelState({
    required this.aboutText,
    required this.channelText,
    required this.isValid,
  });

  factory ChannelState.initial() {
    return ChannelState(
      aboutText: '',
      channelText: '',
      isValid: false,
    );
  }

  ChannelState copyWith({
    String? aboutText,
    String? channelText,
    bool? isValid,
  }) {
    return ChannelState(
      aboutText: aboutText ?? this.aboutText,
      channelText: channelText ?? this.channelText,
      isValid: isValid ?? this.isValid,
    );
  }
}