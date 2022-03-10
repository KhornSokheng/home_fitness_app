import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/events_provider.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/notification/event_card.dart';
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
      body: Column(
        // children: quotes.map((quote) {
        //   return Text(quote);
        // }).toList(),
        children: events.map((event) => Badge(

          padding: EdgeInsets.all(10),
          badgeColor: Colors.redAccent,
          // shape: BadgeShape.square,
          position: BadgePosition.topStart(),
          showBadge: event.status=='new' ? true:false,
          badgeContent: Text(
            'New',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20

            ),
          ),
          child: EventCard(
              event: event,
              delete: () {
                setState(() {
                  events.remove(event);
                });
              },
              markDone: (){
                setState(() {
                  event.markDone();

                });
              }
          ),
        )).toList(),
      ),
    );
  }
}
