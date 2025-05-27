// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, unnecessary_null_comparison, unrelated_type_equality_checks, annotate_overrides, prefer_const_constructors_in_immutables, deprecated_member_use, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/modal/country_state_city.dart';
import 'package:tradeat/view/screen/creations/authentication/setup_profile_3.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../../controller/userInterface/creations/bloc/authentication/setup_profile_2/setup_profile_2.dart';
import '../../../../controller/userInterface/creations/event/authentication/setup_profile_2_event/setup_profile_2_event.dart';
import '../../../../controller/userInterface/creations/state/authentication/setup_profile_2/setup_profile_2.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/button.dart';
import '../../../utils/widget/inputfield.dart';
import '../../../utils/widget/profile_container.dart';
import '../../../utils/widget/select_dropdown.dart';

class SetupProfile_scecond extends StatefulWidget {
  SetupProfile_scecond({super.key});

  @override
  State<SetupProfile_scecond> createState() => _SetupProfile_scecondState();
}

class _SetupProfile_scecondState extends State<SetupProfile_scecond> {
  TextEditingController countryValue = TextEditingController();
  TextEditingController stateValue = TextEditingController();
  TextEditingController cityValue = TextEditingController();

  late TextEditingController addressOneController;
  late TextEditingController addressTwoController;

  String countrySearchQuery = '';
  List<dynamic> filteredCountries = select_address;

  String stateSearchQuery = '';
  List<dynamic> filteredStates = [];

  String citySearchQuery = '';

  List<Map<String, dynamic>> filteredCities = [];
  Map<String, dynamic>? selectedCity;

  dynamic selectedCountry;
  dynamic selectedState;

  void initState() {
    super.initState();
    addressOneController = TextEditingController();
    addressTwoController = TextEditingController();

    // Setup listeners for real-time updates
    addressOneController.addListener(() {
      context.read<AddressBloc>().add(UpdateAddress1Event(addressOneController.text));

      addressTwoController.addListener(() {
        context.read<AddressBloc>().add(UpdateAddress2Event(addressTwoController.text));
      });
    });
  }

  void dispose() {
    addressOneController.dispose();
    addressTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (addressOneController.text != state.addressOne) {
          addressOneController.text = state.addressOne;
          addressOneController.selection = TextSelection.collapsed(offset: state.addressOne.length);
        }

        if (addressTwoController.text != state.addressTwo) {
          addressTwoController.text = state.addressTwo;
          addressTwoController.selection = TextSelection.collapsed(offset: state.addressTwo.length);
        }

        return Scaffold(
          appBar: authenticationAppBar(context: context, progress: state.progressCount.toDouble()),
          body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: AppColor.black_color),
            child: Column(
              children: [
                SizedBox(height: size.height / 60),
                Expanded(
                  child: SingleChildScrollView(
                    child: horizontalPadding(
                      context: context,
                      child: ProfileContainer(
                        context: context,
                        Widget: horizontalPadding(
                          context: context,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height / 30),

                              // Country Dropdown
                              SelectedDropdown(
                                onTap: () async {
                                  final result = await Countrypop(context, countrySearchQuery, filteredCountries, selectedCountry);
                                  if (result != null) {
                                    setState(() {
                                      selectedCountry = result;
                                      selectedState = null;
                                    });
                                  }
                                },
                                context: context,
                                text: selectedCountry?['Country'] ?? AppString.Select_Country,
                                condition: selectedCountry != null,
                                heding: AppString.Select_Country,
                              ),

                              // State Dropdown
                              SelectedDropdown(
                                onTap: () async {
                                  if (selectedCountry == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Please select a country first')),
                                    );
                                    return;
                                  }

                                  filteredStates = List<Map<String, dynamic>>.from(selectedCountry['ProvinceList']);

                                  final result = await StatePop(context, stateSearchQuery, filteredStates, selectedCountry, selectedState);
                                  if (result != null) {
                                    setState(() {
                                      selectedState = result;
                                    });
                                  }
                                },
                                context: context,
                                text: selectedState?['Name'] ?? AppString.Select_State,
                                condition: selectedState != null,
                                heding: AppString.Select_State,
                              ),

                              //City State
                              SelectedDropdown(
                                onTap: () async {
                                  if (selectedState == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a state first')));
                                    return;
                                  }

                                  final cities = (selectedState!['CityList'] as List).cast<Map<String, dynamic>>();

                                  String citySearchQuery = '';
                                  List<Map<String, dynamic>> filteredCities = List<Map<String, dynamic>>.from(cities);
                                  Map<String, dynamic>? selected;

                                  selected = await CityPop(context, cities, citySearchQuery, filteredCities, selectedCity);

                                  if (selected != null) {
                                    setState(() => selectedCity = selected);
                                    context.read<AddressBloc>().add(SelectCityEvent(selected['CityId']));
                                  }
                                },
                                context: context,
                                text: selectedCity?['CityName'] ?? AppString.Select_city,
                                condition: selectedState != null,
                                heding: AppString.Select_city,
                              ),

                              inputfield(
                                onChanged: (val) => context.read<AddressBloc>().add(UpdateAddress1Event(val)),
                                onTap: () => context.read<AddressBloc>().add(Address1FocusLostEvent()),
                                context: context,
                                hintText: AppString.Address_1,
                                text: AppString.Address_1,
                                controller: addressOneController,
                              ),

                              inputfield(
                                onChanged: (val) => context.read<AddressBloc>().add(UpdateAddress2Event(val)),
                                onTap: () => context.read<AddressBloc>().add(Address2FocusLostEvent()),
                                context: context,
                                hintText: AppString.Address_2,
                                text: AppString.Address_2,
                                controller: addressTwoController,
                              ),

                              Button(
                                onTap: () {
                                  if (state.countryProgressUpdated && state.stateProgressUpdated && state.cityProgressUpdated && state.addressOneUpdated && state.addressTwoUpdated) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SetupProfile_thard()));
                                  }
                                },
                                context: context,
                                buttoncondition: state.countryProgressUpdated && state.stateProgressUpdated && state.cityProgressUpdated && state.addressOneUpdated && state.addressTwoUpdated,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<Map<String, dynamic>?> Countrypop(
  BuildContext context,
  String countrySearchQuery,
  List<dynamic> filteredCountries,
  Map<String, dynamic>? currentSelected,
) async {
  final size = AppSize(context);
  Map<String, dynamic>? selected = currentSelected;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<AddressBloc, AddressState>(
        builder: (BuildContext context, AddressState state) {
          return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.Select_Country, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 22)),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppIcon.cancel),
              ),
            ],
          ),
          backgroundColor: AppColor.textfield_color,
          elevation: 0,
          content: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Container(
                width: size.width, height: size.height / 1.7,
                decoration: BoxDecoration(color: AppColor.textfield_color),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Center(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                countrySearchQuery = value.toLowerCase();
                                filteredCountries = select_address.where((country) {
                                  return country['Country'].toLowerCase().contains(countrySearchQuery);
                                }).toList();
                              });
                            },
                            style: TextStyle(color: AppColor.white_color),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                              hintText: AppString.Search,
                              hintStyle: TextStyle(color: AppColor.gray_color),
                              suffixIcon: Icon(Icons.search, color: AppColor.gray_color),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height / 30),
                      SizedBox(
                        height: size.height / 2.8,
                        child: ListView.builder(
                          itemCount: filteredCountries.length,
                          itemBuilder: (BuildContextcontext, int index) {
                            final country = filteredCountries[index];
                            bool isSelected = selected != null && selected?['Country'] == country['Country'];
                            return GestureDetector(
                              onTap: () {
                                setState(() => selected = country);
                                selected = country;
                                context.read<AddressBloc>().add(SelectCountryEvent(index));
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: size.height / 20, width: size.width,
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray_color))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (isSelected) ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          filteredCountries[index]['Country'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            foreground: Paint()..shader = LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [AppColor.yellow_color, AppColor.orange_color],
                                            ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                                          ),
                                        ),
                                        SvgPicture.asset(AppIcon.chake),
                                      ],
                                    ) : Text(filteredCountries[index]['Country'], style: TextStyle(color: AppColor.white_color)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
        },
      );
    },
  );

  return selected;
}

Future<Map<String, dynamic>?> StatePop(
  context,
  stateSearchQuery,
  filteredStates,
  selectedCountry,
  selectedState,
) async {
  final size = AppSize(context);
  Map<String, dynamic>? selected;

    bool hasDispatched = false;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<AddressBloc, AddressState>(
        builder: (BuildContext context, AddressState state) {
          return AlertDialog(
          backgroundColor: AppColor.textfield_color,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.Select_State, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 22)),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AppIcon.cancel),
              ),
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(color: AppColor.textfield_color),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          stateSearchQuery = value.toLowerCase();
                          filteredStates = (selectedCountry['ProvinceList'] as List).cast<Map<String, dynamic>>().where((state) => (state['Name']?.toLowerCase() ?? '').contains(stateSearchQuery)).toList();
                        });
                      },
                      style: TextStyle(color: AppColor.white_color),
                      decoration: InputDecoration(
                        hintText: AppString.Search,
                        hintStyle: TextStyle(color: AppColor.gray_color),
                        suffixIcon: Icon(Icons.search, color: AppColor.gray_color),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                      ),
                    ),
                    SizedBox(height: size.height / 30),
                    SizedBox(
                      height: size.height / 2.8,
                      child: ListView.builder(
                        itemCount: filteredStates.length,
                        itemBuilder: (BuildContext context, int index) {
                          final state = filteredStates[index];
                          bool isSelected = selectedState != null && selectedState['Name'] == state['Name'];
                          return GestureDetector(
                            onTap: () {
                              if (selected == null || selected!['Name'] != state['Name']) {
                                setState(() => selectedState = state);
                                selected = state;
                                if(!hasDispatched){
                                  context.read<AddressBloc>().add(SelectStateEvent(index));
                                  hasDispatched = true;
                                }
                                Navigator.pop(context);
                             }
                            },
                            child: Container(
                              height: size.height / 20, width: size.width,
                              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray_color))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (isSelected)
                                      ? Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state['Name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                foreground: Paint()..shader = LinearGradient(
                                                    colors: [
                                                      AppColor.yellow_color,
                                                      AppColor.orange_color
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ).createShader(Rect.fromLTWH(0, 0, 200, 70),
                                                ),
                                              ),
                                            ),
                                            SvgPicture.asset(AppIcon.chake),
                                          ],
                                        )
                                      : Text(state['Name'], style: TextStyle(color: AppColor.white_color)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
        },
      );
    },
  );

  return selected;
}


Future<Map<String, dynamic>?> CityPop(BuildContext context, List<dynamic> cities, String citySearchQuery,List<Map<String, dynamic>> filteredCities,Map<String, dynamic>? selectedCity) async {
  final size = AppSize(context);

  bool hasDispatched = false;


  filteredCities = List<Map<String, dynamic>>.from(cities);
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppString.Select_State, style: TextStyle(color: AppColor.white_color, fontSize: size.width / 22)),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(AppIcon.cancel),
          ),
        ],
      ),
      backgroundColor: AppColor.textfield_color,
      content: BlocBuilder<AddressBloc, AddressState>(
        builder: (BuildContext context, AddressState state) {
          return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: size.width, height: size.height / 1.7,
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        citySearchQuery = value.toLowerCase();
                        filteredCities = List<Map<String, dynamic>>.from(cities)
                          .where((city) => (city['CityName']?.toLowerCase() ?? '').contains(citySearchQuery)).toList();
                      });
                    },
                    style: TextStyle(color: AppColor.white_color),
                    decoration: InputDecoration(
                      hintText: AppString.Search,
                      hintStyle: TextStyle(color: AppColor.gray_color),
                      suffixIcon: Icon(Icons.search, color: AppColor.gray_color),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.other_text_color), borderRadius: BorderRadius.circular(size.width / 25)),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 2.8,
                    child: ListView.builder(
                      itemCount: filteredCities.length,
                      itemBuilder: (context, index) {
                         final city = filteredCities[index];
                         bool isSelected = selectedCity != null && selectedCity!['CityId'] == city['CityId'];
                        return GestureDetector(
                          onTap: () {
                            setState((){
                              if(!hasDispatched){
                                context.read<AddressBloc>().add(SelectCityEvent(index));
                                hasDispatched = true;
                              }
                                selectedCity = city;
                                Navigator.pop(context, selectedCity);
                              });
                            },
                          child: Container(
                            height: size.height / 20, width: size.width,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.gray_color))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (isSelected) ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      city['CityName'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        foreground: Paint()..shader = LinearGradient(
                                          colors: [
                                            AppColor.yellow_color, AppColor.orange_color
                                          ],
                                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                                        ).createShader(Rect.fromLTWH(0, 0, 200, 70),
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(AppIcon.chake),
                                  ],
                                ) :Text(city['CityName'], style: TextStyle(color: AppColor.white_color)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
        },
      ),
    ),
  );
}
