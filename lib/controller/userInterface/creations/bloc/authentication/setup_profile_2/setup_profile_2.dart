import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../event/authentication/setup_profile_2_event/setup_profile_2_event.dart';
import '../../../state/authentication/setup_profile_2/setup_profile_2.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final List<dynamic> selectAddress;

  AddressBloc(this.selectAddress) : super(AddressState(
    filteredCountries: selectAddress,
    statesForSelectedCountry: [],
    filteredStates: [],
    citiesForSelectedState: [],
    filteredCities: [],
    progressCount: 0,
    countryProgressUpdated: false,
    stateProgressUpdated: false,
    cityProgressUpdated: false,
    addressOneUpdated: false,
    addressTwoUpdated: false,
    addressOne: '',
    addressTwo: '',
  )) {
    on<FilterCountriesEvent>(_filterCountries);
    on<SelectCountryEvent>(_selectCountry);
    on<FilterStatesEvent>(_filterStates);
    on<SelectStateEvent>(_selectState);
    on<FilterCitiesEvent>(_filterCities);
    on<SelectCityEvent>(_selectCity);
    on<UpdateAddress1Event>(_updateAddress1);
    on<UpdateAddress2Event>(_updateAddress2);
    on<Address1FocusLostEvent>(_address1FocusLost);
    on<Address2FocusLostEvent>(_address2FocusLost);
  }

  void _filterCountries(FilterCountriesEvent event, Emitter<AddressState> emit) {
    final filtered = selectAddress.where((country) {
      final name = country['Country'].toString().toLowerCase();
      return name.contains(event.query.toLowerCase());
    }).toList();
    emit(state.copyWith(filteredCountries: filtered));
  }

  void _selectCountry(SelectCountryEvent event, Emitter<AddressState> emit) {
    final country = state.filteredCountries[event.index];
    final countryName = country['Country'];
    final provinces = (country['ProvinceList'] as List).cast<Map<String, dynamic>>();
    final states = provinces.map((e) => e['Name'] as String).toList();

    int newProgress = state.progressCount;
    bool countryUpdated = state.countryProgressUpdated;
    if (!countryUpdated) {
      newProgress += 20;
      countryUpdated = true;
    }

    emit(state.copyWith(
      selectedCountry: countryName,
      selectedState: null,
      selectedCity: null,
      statesForSelectedCountry: states,
      filteredStates: states,
      citiesForSelectedState: [],
      filteredCities: [],
      progressCount: newProgress,
      countryProgressUpdated: countryUpdated,
      stateProgressUpdated: false,
      cityProgressUpdated: false,
    ));
  }

  void _filterStates(FilterStatesEvent event, Emitter<AddressState> emit) {
    final filtered = state.statesForSelectedCountry.where((state) {
      return state.toLowerCase().contains(event.query.toLowerCase());
    }).toList();
    emit(state.copyWith(filteredStates: filtered));
  }

  void _selectState(SelectStateEvent event, Emitter<AddressState> emit) {
    final stateName = state.filteredStates[event.index];
    final country = selectAddress.firstWhere(
      (c) => c['Country'] == state.selectedCountry,
    );
    final province = (country['ProvinceList'] as List).cast<Map<String, dynamic>>()
      .firstWhere((prov) => prov['Name'] == stateName);
    final cities = (province['CityList'] as List).cast<Map<String, dynamic>>()
      .map((city) => city['CityName'] as String).toList();

    int newProgress = state.progressCount;
    bool stateUpdated = state.stateProgressUpdated;
    if (!stateUpdated) {
      newProgress += 20;
      stateUpdated = true;
    }

    emit(state.copyWith(
      selectedState: stateName,
      selectedCity: null,
      citiesForSelectedState: cities,
      filteredCities: cities,
      progressCount: newProgress,
      stateProgressUpdated: stateUpdated,
      cityProgressUpdated: false,
    ));
  }

  void _filterCities(FilterCitiesEvent event, Emitter<AddressState> emit) {
    final filtered = state.citiesForSelectedState.where((city) {
      return city.toLowerCase().contains(event.query.toLowerCase());
    }).toList();
    emit(state.copyWith(filteredCities: filtered));
  }

  void _selectCity(SelectCityEvent event, Emitter<AddressState> emit) {
    final cityName = state.filteredCities[event.index];
    int newProgress = state.progressCount;
    bool cityUpdated = state.cityProgressUpdated;
    if (!cityUpdated) {
      newProgress += 20;
      cityUpdated = true;
    }

    emit(state.copyWith(
      selectedCity: cityName,
      progressCount: newProgress,
      cityProgressUpdated: cityUpdated,
    ));
  }

  void _updateAddress1(UpdateAddress1Event event, Emitter<AddressState> emit) {
  final isUpdated = event.text.isNotEmpty;
  int newProgress = state.progressCount;
  bool addressOneUpdated = state.addressOneUpdated;

  if (isUpdated && !addressOneUpdated) {
    newProgress += 20;
  } else if (!isUpdated && addressOneUpdated) {
    newProgress -= 20;
  }

  emit(state.copyWith(
    addressOne: event.text,
    progressCount: newProgress.clamp(0, 100),
    addressOneUpdated: isUpdated,
  ));
}

void _updateAddress2(UpdateAddress2Event event, Emitter<AddressState> emit) {
  final isUpdated = event.text.isNotEmpty;
  int newProgress = state.progressCount;
  bool addressTwoUpdated = state.addressTwoUpdated;

  if (isUpdated && !addressTwoUpdated) {
    newProgress += 20;
  } else if (!isUpdated && addressTwoUpdated) {
    newProgress -= 20;
  }

  emit(state.copyWith(
    addressTwo: event.text,
    progressCount: newProgress.clamp(0, 100),
    addressTwoUpdated: isUpdated,
  ));
}

  void _address1FocusLost(Address1FocusLostEvent event, Emitter<AddressState> emit) {
    final isUpdated = state.addressOne.isNotEmpty;
    int newProgress = state.progressCount;
    bool addressOneUpdated = state.addressOneUpdated;

    if (isUpdated && !addressOneUpdated) {
      newProgress += 20;
    } else if (!isUpdated && addressOneUpdated) {
      newProgress -= 20;
    }

    emit(state.copyWith(
      progressCount: newProgress.clamp(0, 100),
      addressOneUpdated: isUpdated,
    ));
  }

  void _address2FocusLost(Address2FocusLostEvent event, Emitter<AddressState> emit) {
    final isUpdated = state.addressTwo.isNotEmpty;
    int newProgress = state.progressCount;
    bool addressTwoUpdated = state.addressTwoUpdated;

    if (isUpdated && !addressTwoUpdated) {
      newProgress += 20;
    } else if (!isUpdated && addressTwoUpdated) {
      newProgress -= 20;
    }

    emit(state.copyWith(
      progressCount: newProgress.clamp(0, 100),
      addressTwoUpdated: isUpdated,
    ));
  }
}