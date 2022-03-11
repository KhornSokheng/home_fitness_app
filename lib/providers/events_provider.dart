import 'package:flutter/cupertino.dart';
import 'package:home_fitness/models/event.dart';
import 'package:provider/provider.dart';

class EventsProvider extends ChangeNotifier{
  List<Event> events = [
    Event(name: 'first event', date: DateTime.now(), status: 'new'),
    Event(name: 'second event', date: DateTime.now(), status: 'new'),
    Event(name: 'third event', date: DateTime.now(), status: 'done'),
    Event(name: 'second event', date: DateTime.now(), status: 'new'),
    Event(name: 'third event', date: DateTime.now(), status: 'done'),
    Event(name: 'second event', date: DateTime.now(), status: 'new'),
    Event(name: 'third event', date: DateTime.now(), status: 'done')
  ];




}