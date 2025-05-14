abstract class ProfileEvent {}

class PickImageEvent extends ProfileEvent {}

class AboutTextChangedEvent extends ProfileEvent {
  final String aboutText;
  AboutTextChangedEvent(this.aboutText);
}

class NameEnteredEvent extends ProfileEvent {}

class EmailEnteredEvent extends ProfileEvent {}