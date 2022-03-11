import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';

class EventCard extends StatefulWidget {
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
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: widget.event.status == 'new'? Colors.white:Colors.lightGreen[200],
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: InkWell(
        splashColor: Colors.blue.shade800,
        onTap: () async {
          // future???
          final Event? newEvent = await showDialog<Event>(
            context: context,
            builder: (BuildContext context) => openDialog(),
          );
          if (newEvent == null || newEvent.name.isEmpty || newEvent.date == null) return;

          // setState(() {
          //   // this.newEvent = newEvent;
          //   events.add(newEvent);
          // });
        },
        hoverColor: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  widget.event.name.toUpperCase(),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[400]
                  )
              ),
              SizedBox(height: 10,),
              Text(
                  widget.event.date.toString(),
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
                      onPressed: widget.delete,
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          // SizedBox(width: 10,),
                          // Text('Remove')
                        ],

                      )
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: widget.markDone,
                      child: Row(
                        children: [
                          Icon(Icons.assignment_turned_in_outlined),
                          // SizedBox(width: 10,),
                          // Text('Done')
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

  Widget openDialog(){
    return AlertDialog(
      title: Text(
        widget.event.name.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),

      ),
      elevation: 24,
      backgroundColor: Colors.lightGreen[100],

      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              // setState(() {
              //   widget.event.status = 'done';
              // });
            },
            child: const Text('Cancel')
        ),

      ],
      content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.event.date.toString(),
              )


            ],
          )

      ),
    );
  }
}

