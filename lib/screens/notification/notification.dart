import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/events_provider.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;
    List<Event> events = Provider.of<EventsProvider>(context).events;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Center(child: Text('Notification screen: ${events[0].name}')),
    );
  }
}
