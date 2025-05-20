abstract class AddressEvent {}

class FilterCountriesEvent extends AddressEvent {
  final String query;
  FilterCountriesEvent(this.query);
}

class SelectCountryEvent extends AddressEvent {
  final int index;
  SelectCountryEvent(this.index);
}

class FilterStatesEvent extends AddressEvent {
  final String query;
  FilterStatesEvent(this.query);
}

class SelectStateEvent extends AddressEvent {
  final int index;
  SelectStateEvent(this.index);
}

class FilterCitiesEvent extends AddressEvent {
  final String query;
  FilterCitiesEvent(this.query);
}

class SelectCityEvent extends AddressEvent {
  final int index;
  SelectCityEvent(this.index);
}

class UpdateAddress1Event extends AddressEvent {
  final String text;
  UpdateAddress1Event(this.text);
}

class UpdateAddress2Event extends AddressEvent {
  final String text;
  UpdateAddress2Event(this.text);
}

class Address1FocusLostEvent extends AddressEvent {}

class Address2FocusLostEvent extends AddressEvent {}