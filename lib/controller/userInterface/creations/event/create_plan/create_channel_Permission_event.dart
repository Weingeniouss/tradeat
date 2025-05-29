abstract class ChannelPermissionEvent {}

class TogglePrivateEvent extends ChannelPermissionEvent {}

class ToggleJoinChannelEvent extends ChannelPermissionEvent {}

class AddChannelFeatureEvent extends ChannelPermissionEvent {
  final String feature;

  AddChannelFeatureEvent(this.feature);
}

class RemoveChannelFeatureEvent extends ChannelPermissionEvent {
  final int index;

  RemoveChannelFeatureEvent(this.index);
}