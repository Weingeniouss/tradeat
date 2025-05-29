// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../event/create_plan/create_channel_evant.dart';
import '../../state/create_plan/create_channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelState.initial()) {
    on<AboutingTextChanged>(_onAboutingTextChanged);
    on<ChannelTextChanged>(_onChannelTextChanged);
  }

  void _onAboutingTextChanged(AboutingTextChanged event, Emitter<ChannelState> emit) {
    final about = event.text;
    final channel = state.channelText;
    emit(state.copyWith(
      aboutText: about,
      isValid: _validate(about, channel),
    ));
  }

  void _onChannelTextChanged(ChannelTextChanged event, Emitter<ChannelState> emit) {
    final about = state.aboutText;
    final channel = event.text;
    emit(state.copyWith(
      channelText: channel,
      isValid: _validate(about, channel),
    ));
  }

  bool _validate(String about, String channel) {
    final result = about.isNotEmpty && about.length >= 10 && channel.isNotEmpty && channel.length >= 4;
    print('Validation result: $result');
    return result;
  }
}