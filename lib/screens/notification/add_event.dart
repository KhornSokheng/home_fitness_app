import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay(hour: 17, minute: 00);




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
                contentPadding: EdgeInsets.all(10),
                hintText: 'Ex: Yoga',
                labelText: 'reminder name'
              ),
              autofocus: true,
              controller: eventNameController,
              onSubmitted: (_)=>submit(),

            ),
            SizedBox(height: 25,),
            Text(DateFormat.yMMMEd().format(date)),
            SizedBox(height: 10,),
            ElevatedButton(
                child: Text('select date'),
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    initialDatePickerMode: DatePickerMode.day,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: date,
                      lastDate: DateTime(2100)
                  );

                  // if 'cancel' => null
                  if(selectedDate == null) {
                    setState(() {
                      date = date.add(const Duration(days: 1));
                    });
                    return;
                  }

                  // if 'OK', we got a DataTime obj
                  setState(() {
                    date = selectedDate;
                  });
                },
            ),
            SizedBox(height: 25,),
            Text('${time.hour} : ${time.minute.toString()=='0' ? '00':time.minute.toString()}'),
            SizedBox(height: 10,),
            ElevatedButton(
              child: Text('select time'),
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(

                    context: context,
                    initialTime: time,
                    // firstDate: date,
                    // lastDate: DateTime(2100)
                );


                if(selectedTime != null) {
                  setState(() {
                    time = selectedTime;
                  });
                  return;
                }

              },
            ),

          ],
        )

      ),

    );
  }
  void submit(){
    // print(eventNameController.text);
    Event e = Event(
        name: eventNameController.text,
        date: DateTime(date.year,date.month,date.day,time.hour,time.minute),
        status: 'new');
    Navigator.of(context).pop(e);

    // eventNameController.clear();

  }
}

