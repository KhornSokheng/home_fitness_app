import 'package:flutter/cupertino.dart';
import 'package:home_fitness/models/event.dart';
import 'package:provider/provider.dart';

class EventsProvider extends ChangeNotifier{
  List<Event> events = [
    Event(name: 'Click The Top Rigth Button to Add Event', date: DateTime.now(), status: 'new'),
  ];

}