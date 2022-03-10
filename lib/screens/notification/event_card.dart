import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';

class EventCard extends StatelessWidget {
  // const EventCard({Key? key}) : super(key: key);

  final Event event;
  final void Function() delete;
  final void Function() markDone;

  EventCard({
    required this.event,
    required this.delete,
    required this.markDone

  });


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: event.status == 'new'? Colors.white:Colors.lightGreen[200],
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: InkWell(
        splashColor: Colors.blue.shade800,
        onTap: () {
          debugPrint('Card tapped.');
        },
        hoverColor: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  event.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange[400]
                  )
              ),
              SizedBox(height: 10,),
              Text(
                  event.date.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange
                  )
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  // TextButton.icon(
                  //   onPressed: delete,
                  //   icon:Icon(Icons.delete),
                  //   label:Text('Remove'),
                  //
                  // ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                      onPressed: delete,
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 10,),
                          Text('Remove')
                        ],

                      )
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: markDone,
                      child: Row(
                        children: [
                          Icon(Icons.assignment_turned_in_outlined),
                          SizedBox(width: 10,),
                          Text('Done')
                        ],

                      )
                  ),
                  // TextButton.icon(
                  //   // style: ButtonStyle(
                  //   //   backgroundColor:
                  //   // ),
                  //     onPressed: markDone,
                  //     icon: Icon(Icons.assignment_turned_in_outlined),
                  //     label: Text('mark done')
                  // ),
                ],
              )




            ],
          ),
        ),
      ),
    );
  }
}
