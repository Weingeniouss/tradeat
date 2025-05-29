class ChannelPermissionState {
  final bool isPrivate;
  final bool isJoinChannel;
  final List<String> features;

  ChannelPermissionState({this.isPrivate = false, this.isJoinChannel = false, this.features = const []});

  ChannelPermissionState copyWith({
    bool? isPrivate,
    bool? isJoinChannel,
    List<String>? features,
  }) {
    return ChannelPermissionState(
      isPrivate: isPrivate ?? this.isPrivate,
      isJoinChannel: isJoinChannel ?? this.isJoinChannel,
      features: features ?? this.features,
    );
  }
}
