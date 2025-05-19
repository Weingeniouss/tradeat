// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/modal/country_state_city.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/responsive.dart';
import 'package:tradeat/view/utils/widget/app_size.dart';
import 'package:tradeat/view/utils/widget/horizontal_padding.dart';
import '../../../utils/widget/authentication_appbar.dart';
import '../../../utils/widget/button.dart';
import '../../../utils/widget/inputfield.dart';
import '../../../utils/widget/profile_container.dart';
import '../../../utils/widget/select_dropdown.dart';

class SetupProfile_scecond extends StatefulWidget {
  const SetupProfile_scecond({super.key});

  @override
  State<SetupProfile_scecond> createState() => _SetupProfile_scecondState();
}

class _SetupProfile_scecondState extends State<SetupProfile_scecond> {
  TextEditingController countryValue = TextEditingController();
  TextEditingController stateValue = TextEditingController();
  TextEditingController cityValue = TextEditingController();
  TextEditingController Addressone = TextEditingController();
  TextEditingController Addresstwo = TextEditingController();

  List<dynamic> filteredCountries = [];
  List<dynamic> filteredStates = [];
  List<dynamic> filteredCities = [];

  @override
  void initState() {
    filteredCountries = select_address;
    super.initState();
  }

  void filtercountries(String query) {
    setState(() {
      filteredCountries = select_address.where((country) {
        final countriesname = country['Country'].toString().toLowerCase();
        return countriesname.contains(query.toLowerCase());
      }).toList();
    });
  }

  void filterStates(String query) {
    setState(() {
      filteredStates = statesForSelectedCountry.where((state) {
        return state.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void filterCities(String query) {
    setState(() {
      filteredCities = citiesForSelectedState.where((city) {
        return city.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<String> statesForSelectedCountry = [];
  List<String> citiesForSelectedState = [];

  double progresscount = 0;
  bool countryProgressUpdated = false;
  bool stateProgressUpdated = false;
  bool cityProgressUpdated = false;
  bool Address_one_update = false;
  bool Address_two_update = false;

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    responsive_text(context);
    return Scaffold(
        appBar: authenticationAppBar(context: context, progress: progresscount),
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
                             selectdDropdown(
                                controller: countryValue,
                                onChanged: filtercountries,
                                heding: AppString.Country,
                                context: context,
                                text: selectedCountry ?? AppString.Select_Country,
                                Stringcolor: (selectedCountry != null) ? AppColor.white_color : AppColor.gray_color,
                                hinttext: AppString.Select_Country,
                                child: ListView.builder(
                                  itemCount: filteredCountries.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    String country = filteredCountries[index]['Country'];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedCountry = country;
                                          selectedState = null;
                                          selectedCity = null;

                                          // Get states for selected country
                                          statesForSelectedCountry = List<String>.from(filteredCountries[index]['ProvinceList'].map((e) => e['Name']));
                                          filteredStates = statesForSelectedCountry;

                                          if (!countryProgressUpdated) {
                                            progresscount += 20;
                                            countryProgressUpdated = true;
                                          }

                                          citiesForSelectedState.clear();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: size.height / 20,
                                        width: size.width,
                                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.textfield_color_2))),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                (selectedCountry == country)
                                                    ? Text(
                                                        country,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          foreground: Paint()..shader = LinearGradient(
                                                              begin: Alignment.topCenter,
                                                              end: Alignment.bottomCenter,
                                                              colors: [
                                                                AppColor.yellow_color,
                                                                AppColor.orange_color,
                                                              ],
                                                            ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                                                        ),
                                                      )
                                                    : Text(country, style: TextStyle(color: AppColor.white_color)),
                                                (selectedCountry == country)
                                                    ? SvgPicture.asset(AppIcon.chake)
                                                    : SizedBox(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // State Dropdown
                              selectdDropdown(
                                controller: stateValue,
                                onChanged: filterStates,
                                heding: AppString.State,
                                context: context,
                                text: selectedState ?? AppString.Select_State,
                                Stringcolor: (selectedState != null) ? AppColor.white_color : AppColor.gray_color,
                                hinttext: AppString.Select_State,
                                child: (selectedCountry != null) ? ListView.builder(
                                  itemCount: filteredStates.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    String state = filteredStates[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedState = state;
                                          selectedCity = null;
                                          // Find selected country and province
                                          final selectedCountryData = select_address.firstWhere((e) => e['Country'] == selectedCountry);
                                          final selectedProvinceData = selectedCountryData['ProvinceList'].firstWhere((prov) => prov['Name'] == state);
                                          citiesForSelectedState = List<String>.from(selectedProvinceData['CityList'].map((e) => e['CityName']));
                                          // Get cities for selected state
                                          filteredCities = citiesForSelectedState;
                                          if (!stateProgressUpdated) {
                                            progresscount += 20;
                                            stateProgressUpdated = true;
                                          }
                                          // citiesForSelectedState = List<String>.from(selectedProvinceData['CityList'].map((city) => city['CityName']));
                                        });
                                        Navigator.pop(context);
                                        },
                                      child: Container(
                                        height: size.height / 20,
                                        width: size.width,
                                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.textfield_color_2))),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                (selectedState == state) ? Text(
                                                  state,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    foreground: Paint()..shader = LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        AppColor.yellow_color,
                                                        AppColor.orange_color,
                                                      ],
                                                    ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                                                  ),
                                                )
                                                    : Text(state, style: TextStyle(color: AppColor.white_color)),
                                                (selectedState == state)
                                                    ? SvgPicture.asset(AppIcon.chake)
                                                    : SizedBox(),
                                              ]
                                            ),
                                          ],
                                        ),
                                      ),
                                    );},
                                ) : null,
                              ),

                              // City Dropdown
                              selectdDropdown(
                                controller: cityValue,
                                onChanged: filterCities,
                                heding: AppString.City,
                                context: context,
                                text: selectedCity ?? AppString.Select_city,
                                Stringcolor: (selectedCity != null) ? AppColor.white_color : AppColor.gray_color,
                                hinttext: AppString.Select_city,
                                child: (citiesForSelectedState.isNotEmpty) ? ListView.builder(
                                  itemCount: filteredCities.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    String city = filteredCities[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedCity = city;
                                          if (!cityProgressUpdated) {
                                            progresscount += 20;
                                            cityProgressUpdated = true;
                                          }
                                        });
                                        Navigator.pop(context);
                                        },
                                      child: Container(
                                        height: size.height / 20,
                                        width: size.width,
                                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.textfield_color_2))),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                (selectedCity == city)
                                                    ? Text(
                                                  city,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    foreground: Paint()..shader = LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        AppColor.yellow_color,
                                                        AppColor.orange_color,
                                                      ],
                                                    ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                                                  ),
                                                )
                                                    : Text(city, style: TextStyle(color: AppColor.white_color)),
                                                (selectedCity == city)
                                                    ? SvgPicture.asset(AppIcon.chake)
                                                    : SizedBox(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                    },
                                ) : null,
                              ),

                              inputfield(
                                onChanged: (val) {
                                  setState(() {
                                    if (Address_one_update && Addressone.text.isEmpty) {
                                      progresscount -= 20;
                                      Address_one_update = false;
                                    } else if (!Address_one_update) {
                                      progresscount += 20;
                                      Address_one_update = true;
                                    }
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    if (!Address_one_update) {
                                      progresscount += 20;
                                      Address_one_update = true;
                                    } else if (Address_one_update && Addressone.text.isEmpty) {
                                      progresscount -= 20;
                                      Address_one_update = false;
                                    }
                                  });
                                },
                                context: context,
                                hintText: AppString.Address_1,
                                text: AppString.Address_1,
                                controller: Addressone,
                              ),
                              inputfield(
                                onChanged: (val) {
                                  setState(() {
                                    if (Address_two_update && Addresstwo.text.isEmpty) {
                                      progresscount = (progresscount - 20).clamp(0, 100);
                                      Address_two_update = false;
                                    } else if (!Address_two_update && Addresstwo.text.isNotEmpty) {
                                      progresscount = (progresscount + 20).clamp(0, 100);
                                      Address_two_update = true;
                                    }
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    if (Address_two_update && Addresstwo.text.isEmpty) {
                                      progresscount = (progresscount - 20).clamp(0, 100);
                                      Address_two_update = false;
                                    } else if (!Address_two_update && Addresstwo.text.isNotEmpty) {
                                      progresscount = (progresscount + 20).clamp(0, 100);
                                      Address_two_update = true;
                                    }
                                  });
                                },
                                context: context,
                                hintText: AppString.Address_2,
                                text: AppString.Address_2,
                                controller: Addresstwo,
                              ),

                              Button(
                                onTap: () {
                                  if (countryProgressUpdated == true && stateProgressUpdated == true && cityProgressUpdated == true && Address_one_update == true && Address_two_update == true) {}
                                },
                                context: context,
                                buttoncondition: countryProgressUpdated == true && stateProgressUpdated == true && cityProgressUpdated == true && Address_one_update == true && Address_two_update == true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      );
  }
}
