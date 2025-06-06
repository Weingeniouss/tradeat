import 'create_channel_Permission_event.dart';

abstract class ChannelEvent {}

class AboutingTextChanged extends ChannelEvent {
  final String text;
  AboutingTextChanged(this.text);
}

class ChannelTextChanged extends ChannelEvent {
  final String text;
  ChannelTextChanged(this.text);
}

class LoadSavedFeaturesEvent extends ChannelPermissionEvent {
  final List<String> features;

  LoadSavedFeaturesEvent(this.features);
}