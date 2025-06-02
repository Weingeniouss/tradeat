import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/create_plan/channel_plan_state.dart';

class DurationCubit extends Cubit<DurationState> {
  DurationCubit() : super(DurationState(isToggled: false));

  void toggleContainerHeight() {
    emit(state.copyWith(isToggled: !state.isToggled));
  }

  void selectDuration(String selected) {
    emit(state.copyWith(
      selectedDuration: selected,
      selectedDay: selected,
    ));
  }

  void selectTrialPeriod(String selected2) {
    emit(state.copyWith(
      selectedDurationSecond: selected2,
      selectedDaySecond: selected2,
    ));
  }
}