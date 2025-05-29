abstract class ChannelEvent {}

class AboutingTextChanged extends ChannelEvent {
  final String text;
  AboutingTextChanged(this.text);
}

class ChannelTextChanged extends ChannelEvent {
  final String text;
  ChannelTextChanged(this.text);
}