
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradeat/controller/userInterface/creations/state/create_plan/create_channel_Permission_state.dart';
import '../../event/create_plan/create_channel_Permission_event.dart';
import '../../event/create_plan/create_channel_evant.dart';

class ChannelPermissionBloc extends Bloc<ChannelPermissionEvent, ChannelPermissionState> {
  ChannelPermissionBloc() : super(ChannelPermissionState(features: [])) {
    on<AddChannelFeatureEvent>((event, emit) {
      final updated = List<String>.from(state.features)..add(event.feature);
      emit(state.copyWith(features: updated));
    });

    on<RemoveChannelFeatureEvent>((event, emit) {
      final updated = List<String>.from(state.features)..removeAt(event.index);
      emit(state.copyWith(features: updated));
    });

    on<LoadSavedFeaturesEvent>((event, emit) {
      emit(state.copyWith(features: event.features));
    });

    on<TogglePrivateEvent>((event, emit) {
      emit(state.copyWith(isPrivate: !state.isPrivate));
    });

    on<ToggleJoinChannelEvent>((event, emit) {
      emit(state.copyWith(isJoinChannel: !state.isJoinChannel));
    });
  }
}