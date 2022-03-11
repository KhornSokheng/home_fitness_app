import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/events_provider.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/notification/add_event.dart';
import 'package:home_fitness/screens/notification/event_card.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  // late Event newEvent;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;
    List<Event> events = Provider.of<EventsProvider>(context).events;



    return Scaffold(
      floatingActionButton: FloatingActionButton(

        onPressed: () async {
          // future???
          final Event? newEvent = await showDialog<Event>(
            context: context,
            builder: (BuildContext context) => AddEvent(),
          );
          if (newEvent == null || newEvent.name.isEmpty || newEvent.date == null) return;

          setState(() {
            // this.newEvent = newEvent;
            events.add(newEvent);
          });
        },
        tooltip: 'Add New Reminder',
        child: Icon(Icons.add_alarm_outlined),
        backgroundColor: Colors.orange,
        splashColor: Colors.orange.shade800,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        // reverse: true,

        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
          child: Column(
            // children: quotes.map((quote) {
            //   return Text(quote);
            // }).toList(),
            children: events.reversed.map((event) => Badge(

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
        ),
      ),
    );
  }
}
