// ignore_for_file: file_names

abstract class NavigationEvent {}

class SelectNavigationTab extends NavigationEvent {
  final int index;

  SelectNavigationTab(this.index);
}