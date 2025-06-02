class DurationState {
  final bool isToggled;
  final String? selectedDuration;
  final String? selectedDay;
  final String? selectedDurationSecond;
  final String? selectedDaySecond;

  DurationState({
    required this.isToggled,
    this.selectedDuration,
    this.selectedDay,
    this.selectedDurationSecond,
    this.selectedDaySecond,
  });

  DurationState copyWith({
    bool? isToggled,
    String? selectedDuration,
    String? selectedDay,
    String? selectedDurationSecond,
    String? selectedDaySecond,
  }) {
    return DurationState(
      isToggled: isToggled ?? this.isToggled,
      selectedDuration: selectedDuration ?? this.selectedDuration,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedDurationSecond: selectedDurationSecond ?? this.selectedDurationSecond,
      selectedDaySecond: selectedDaySecond ?? this.selectedDaySecond,
    );
  }
}