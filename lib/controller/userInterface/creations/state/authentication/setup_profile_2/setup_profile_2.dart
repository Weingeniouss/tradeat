class AddressState {
  final List<dynamic> filteredCountries;
  final List<String> statesForSelectedCountry;
  final List<String> filteredStates;
  final List<String> citiesForSelectedState;
  final List<String> filteredCities;
  final String? selectedCountry;
  final String? selectedState;
  final String? selectedCity;
  final int progressCount;
  final bool countryProgressUpdated;
  final bool stateProgressUpdated;
  final bool cityProgressUpdated;
  final bool addressOneUpdated;
  final bool addressTwoUpdated;
  final String addressOne;
  final String addressTwo;

  AddressState({
    required this.filteredCountries,
    required this.statesForSelectedCountry,
    required this.filteredStates,
    required this.citiesForSelectedState,
    required this.filteredCities,
    this.selectedCountry,
    this.selectedState,
    this.selectedCity,
    required this.progressCount,
    required this.countryProgressUpdated,
    required this.stateProgressUpdated,
    required this.cityProgressUpdated,
    required this.addressOneUpdated,
    required this.addressTwoUpdated,
    required this.addressOne,
    required this.addressTwo,
  });

  AddressState copyWith({
    List<dynamic>? filteredCountries,
    List<String>? statesForSelectedCountry,
    List<String>? filteredStates,
    List<String>? citiesForSelectedState,
    List<String>? filteredCities,
    String? selectedCountry,
    String? selectedState,
    String? selectedCity,
    int? progressCount,
    bool? countryProgressUpdated,
    bool? stateProgressUpdated,
    bool? cityProgressUpdated,
    bool? addressOneUpdated,
    bool? addressTwoUpdated,
    String? addressOne,
    String? addressTwo,
  }) {
    return AddressState(
      filteredCountries: filteredCountries ?? this.filteredCountries,
      statesForSelectedCountry: statesForSelectedCountry ?? this.statesForSelectedCountry,
      filteredStates: filteredStates ?? this.filteredStates,
      citiesForSelectedState: citiesForSelectedState ?? this.citiesForSelectedState,
      filteredCities: filteredCities ?? this.filteredCities,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
      selectedCity: selectedCity ?? this.selectedCity,
      progressCount: progressCount ?? this.progressCount,
      countryProgressUpdated: countryProgressUpdated ?? this.countryProgressUpdated,
      stateProgressUpdated: stateProgressUpdated ?? this.stateProgressUpdated,
      cityProgressUpdated: cityProgressUpdated ?? this.cityProgressUpdated,
      addressOneUpdated: addressOneUpdated ?? this.addressOneUpdated,
      addressTwoUpdated: addressTwoUpdated ?? this.addressTwoUpdated,
      addressOne: addressOne ?? this.addressOne,
      addressTwo: addressTwo ?? this.addressTwo,
    );
  }
}