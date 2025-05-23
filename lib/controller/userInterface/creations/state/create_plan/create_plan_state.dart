abstract class PricingState {}

class PricingInitial extends PricingState {
  final int currentIndex;
  PricingInitial({this.currentIndex = 0});
}

class PricingSubscribed extends PricingState {
  final int subscribedIndex;
  PricingSubscribed(this.subscribedIndex);
}