// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, unnecessary_null_comparison, unrelated_type_equality_checks, annotate_overrides, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradeat/view/utils/app_color.dart';
import 'package:tradeat/view/utils/app_icon.dart';
import 'package:tradeat/view/utils/app_string.dart';
import 'package:tradeat/view/utils/responsive.dart';
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

  // List<dynamic> filteredCountries = [];
  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    responsive_text(context);
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
                              selectdDropdown(
                                 controller: countryValue,
                                 onChanged: (query) => context.read<AddressBloc>().add(FilterCountriesEvent(query)),
                                 heding: AppString.Country,
                                 context: context,
                                 text: state.selectedCountry ?? AppString.Select_Country,
                                 Stringcolor: (state.selectedCountry != null) ? AppColor.white_color : AppColor.gray_color,
                                 hinttext: AppString.Select_Country,
                                 child: ListView.builder(
                                   itemCount: state.filteredCountries.length,
                                   itemBuilder: (BuildContext context, int index) {
                                     String country = state.filteredCountries[index]['Country'];
                                     return GestureDetector(
                                       onTap: () {
                                       context.read<AddressBloc>().add(SelectCountryEvent(index));
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
                                                 (state.selectedCountry == country)
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
                                                 (state.selectedCountry == country)
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
                                 onChanged: (query) => context.read<AddressBloc>().add(FilterStatesEvent(query)),
                                 heding: AppString.State,
                                 context: context,
                                 text: state.selectedState ?? AppString.Select_State,
                                 Stringcolor: (state.selectedState != null) ? AppColor.white_color : AppColor.gray_color,
                                 hinttext: AppString.Select_State,
                                 child: (state.statesForSelectedCountry.isNotEmpty) ? ListView.builder(
                                   itemCount: state.filteredStates.length,
                                   itemBuilder: (BuildContext context, int index) {
                                     String selectedstate = state.filteredStates[index];
                                     return GestureDetector(
                                       onTap: () {
                                           context.read<AddressBloc>().add(SelectStateEvent(index));
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
                                                 (state.selectedState == selectedstate) ? Text(
                                                   selectedstate,
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
                                                     : Text(selectedstate, style: TextStyle(color: AppColor.white_color)),
                                                 (state.selectedState == selectedstate)
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
                                 onChanged: (query) => context.read<AddressBloc>().add(FilterCitiesEvent(query)),
                                 heding: AppString.City,
                                 context: context,
                                 text: state.selectedCity ?? AppString.Select_city,
                                 Stringcolor: (state.selectedCity != null) ? AppColor.white_color : AppColor.gray_color,
                                 hinttext: AppString.Select_city,
                                 child: (state.citiesForSelectedState.isNotEmpty) ? ListView.builder(
                                   itemCount: state.filteredCities.length,
                                   itemBuilder: (BuildContext context, int index) {
                                     String city = state.filteredCities[index];
                                     return GestureDetector(
                                       onTap: () {
                                           context.read<AddressBloc>().add(SelectCityEvent(index));
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
                                                 (state.selectedCity == city)
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
                                                 (state.selectedCity == city)
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
                                   if (state.countryProgressUpdated && state.stateProgressUpdated && state.cityProgressUpdated && state.addressOneUpdated && state.addressTwoUpdated) {}
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
