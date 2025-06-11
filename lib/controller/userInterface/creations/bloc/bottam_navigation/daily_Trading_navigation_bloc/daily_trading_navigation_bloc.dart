import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../event/bottam_navigation/daily_Trading_navigation/daliy_trading_navigation_Event.dart';
import '../../../state/Bottam_navigation/daily_Trading_navigation/daliy_Trading_navigation_state.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState(0)) {
    on<SelectNavigationTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}