import 'dart:async';

class BaseBloc {
  List<StreamSubscription> subscriptions = [];

  BaseBloc();

  void dispose() {
    subscriptions.forEach((element) {
      element.cancel();
    });
  }
}

extension StreamSubscriptionExtenion on StreamSubscription {
  void addTo(List<StreamSubscription> disposables) {
    disposables.add(this);
  }
}
