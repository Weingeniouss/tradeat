import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradeat/controller/userInterface/creations/event/create_plan/create_plan_event.dart';
import 'package:tradeat/controller/userInterface/creations/state/create_plan/create_plan_state.dart';

class PricingBloc extends Bloc<PricingEvent, PricingState> {
  PricingBloc() : super(PricingInitial()) {
    on<PricingIndexChanged>((event, emit) {
      emit(PricingInitial(currentIndex: event.index));
    });

    on<SubscribeButtonPressed>((event, emit) {
      emit(PricingSubscribed(event.selectedIndex));
    });
  }
}