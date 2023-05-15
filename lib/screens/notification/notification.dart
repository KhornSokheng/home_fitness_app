import 'package:badges/badges.dart' as badge;
import 'package:cloud_firestore/cloud_firestore.dart';
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
            builder: (BuildContext context) => const AddEvent(),
          );
          if (newEvent == null || newEvent.name.isEmpty || newEvent.date == null) return;

          //update notification
          final docNotification = FirebaseFirestore.instance.collection('notifications').doc();
          newEvent.id = docNotification.id;
          newEvent.user_id = user.id;
          docNotification.set({
            'id': newEvent.id,
            'user_id': user.id,
            'name': newEvent.name,
            'date': newEvent.date,
            'status': newEvent.status
          });

          setState(() {
            // this.newEvent = newEvent;
            events.add(newEvent);
          });
        },
        tooltip: 'Add New Reminder',
        child: const Icon(Icons.add_alarm_outlined),
        backgroundColor: Colors.orange,
        splashColor: Colors.orange.shade800,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        // reverse: true,

        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 50),
          child: Column(
            // children: quotes.map((quote) {
            //   return Text(quote);
            // }).toList(),
            children: events.reversed.map((event) => Stack(
              children: [badge.Badge(

                // padding: const EdgeInsets.all(10),
                // badgeColor: Colors.redAccent,
                // shape: BadgeShape.square,
                position: badge.BadgePosition.topStart(),
                showBadge: event.status=='new' ? true:false,
                badgeContent: const Text(
                  'New',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20

                  ),
                ),
                // child: EventCard(
                //     event: event,
                //     delete: () {
                //       setState(() {
                //         events.remove(event);
                //       });
                //     },
                //     markDone: (){
                //       setState(() {
                //         event.markDone();
                //
                //       });
                //     }
                // ),
              ),
              EventCard(
                  event: event,
                  delete: () {
                    setState(() {
                      events.remove(event);
                    });
                  },
                  markDone: (){
                    setState(() {
                      event.markDone();

                      //update as done
                      final docNotification = FirebaseFirestore.instance.collection('notifications').doc(event.id);

                      docNotification.update({

                        'status': event.status
                      });

                    });
                  }
              ),
            ]
            )).toList(),
          ),
        ),
      ),
    );
  }
}
