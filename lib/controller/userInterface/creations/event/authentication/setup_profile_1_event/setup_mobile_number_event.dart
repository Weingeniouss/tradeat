abstract class ProfileEvent {}

class PickImageEvent extends ProfileEvent {}

class AboutTextChangedEvent extends ProfileEvent {
  final String aboutText;
  AboutTextChangedEvent(this.aboutText);
}

class NameEnteredEvent extends ProfileEvent {
  final String name;

  NameEnteredEvent(this.name);
}

class EmailEnteredEvent extends ProfileEvent {
  final String email;

  EmailEnteredEvent(this.email);
}