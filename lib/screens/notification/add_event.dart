import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  late TextEditingController eventNameController;
  @override
  void initState() {
    super.initState();
    eventNameController = TextEditingController();
  }
  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add New Reminder',
        style: TextStyle(fontWeight: FontWeight.bold),

      ),
      elevation: 24,
      backgroundColor: Colors.lightGreen[100],

      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: const Text('Cancel')
        ),
        TextButton(
            onPressed: submit,
            child: const Text('Add')

        )
      ],
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Ex: Yoga'
              ),
              autofocus: true,
              controller: eventNameController,
              onSubmitted: (_)=>submit(),

            ),
            TextField(
              autofocus: true,

            ),
          ],
        )

      ),

    );
  }
  void submit(){
    // print(eventNameController.text);
    Event e = Event(name: eventNameController.text, date: DateTime.now(), status: 'new');
    Navigator.of(context).pop(e);

    // eventNameController.clear();

  }
}

