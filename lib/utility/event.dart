import 'dart:async';

import '../../model/item_model.dart';

abstract class Event {}

class LoadMoreEvent extends Event {}

class LoadingEvent extends Event {
  final bool isLoading;

  LoadingEvent(this.isLoading);
}

class DataLoadedEvent extends Event {
  final List<Item> newItems;

  DataLoadedEvent(this.newItems);
}

class EventBus {
  final StreamController<Event> _streamController = StreamController<Event>.broadcast();

  void fire(Event event) {
    _streamController.add(event);
  }

  Stream<T> on<T extends Event>() {
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  void dispose() {
    _streamController.close();
  }
}
