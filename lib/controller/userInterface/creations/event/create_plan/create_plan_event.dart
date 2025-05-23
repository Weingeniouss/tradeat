abstract class PricingEvent {}

class PricingIndexChanged extends PricingEvent{
  final int index;
  PricingIndexChanged(this.index);
}

class SubscribeButtonPressed extends PricingEvent{
  final int selectedIndex;
  SubscribeButtonPressed(this.selectedIndex);
}