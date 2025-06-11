import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../event/bottam_navigation/channale_navigation/channle_navigation_Evant.dart';
import '../../../state/Bottam_navigation/channale_navigation/channale_navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<SelectNavigationTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}