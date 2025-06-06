// ignore_for_file: file_names

class ChannelPermissionState {
  final bool isPrivate;
  final bool isJoinChannel;
  final List<String> features;

  ChannelPermissionState({this.isPrivate = false, this.isJoinChannel = false, required this.features});

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
