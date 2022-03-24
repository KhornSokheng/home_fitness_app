import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/event.dart';
import 'package:home_fitness/models/video.dart';
import 'package:intl/intl.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  DateTime releaseDate = DateTime.now();

  TimeOfDay time = TimeOfDay(hour: 17, minute: 00);

  final formKey = GlobalKey<FormState>(); //key to validate form

  List<String> levelItems = ['Easy', 'Medium', 'Hard'];
  final typeItems = [
    'Yoga',
    'Muscle',
    'Endurance',
    'Strength',
    'Aerobic',
    'Flexibility'
  ];
  String? type;
  String? level;

  late TextEditingController titleController;
  // TextEditingController videoUrlController= TextEditingController();
  late TextEditingController videoUrlController;
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController caloryController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    videoUrlController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add New Video',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 24,
      backgroundColor: Colors.lightGreen[100],
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        TextButton(onPressed: submit, child: const Text('Add'))
      ],
      content: SingleChildScrollView(
        child: Container(
            child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) {
                  if (value != null && value.length < 1) {
                    return 'Enter a title';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Ex: Basic Yoga',
                    labelText: 'Title'),
                autofocus: true,
                controller: titleController,
                onFieldSubmitted: (_) => submit(),
                // onSubmitted: (_)=>submit(),
                // obscureText: true,
              ),

              TextFormField(
                validator: (value) {
                  if (value != null && value.length < 1) {
                    return 'Enter the link of video';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '.mp4',
                    labelText: 'Video URl'),
                autofocus: true,
                controller: videoUrlController,
                onFieldSubmitted: (_) => submit(),
              ),

              TextFormField(
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'Enter link of image';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '.png, .jpg ...',
                    labelText: 'Thumbnail Image URl'),
                autofocus: true,
                controller: imageUrlController,
                onFieldSubmitted: (_) => submit(),
              ),

              TextFormField(
                validator: (value) {
                  print('val $value');
                  if (value == null ||
                      value.length < 1 ||
                      num.tryParse(value) == null) {
                    return 'Enter a number';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '5',
                    labelText: 'Duration in minute'),
                autofocus: true,
                controller: durationController,
                onFieldSubmitted: (_) => submit(),
              ),

              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.length < 1 ||
                      num.tryParse(value) == null) {
                    return 'Enter a number';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '300',
                    labelText: 'Calories Burn'),
                autofocus: true,
                controller: caloryController,
                onFieldSubmitted: (_) => submit(),
              ),

              TextFormField(
                validator: (value) {
                  if (value != null && value.length < 1) {
                    return 'Enter something...';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '',
                    labelText: 'Description'),
                autofocus: true,
                controller: descController,
                onFieldSubmitted: (_) => submit(),
              ),

              // select type

              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      hint: Text('Type'),
                      value: type,
                      isExpanded: true,
                      items: typeItems.map(buildTypeItem).toList(),
                      onChanged: (value) {
                        return setState(() {
                          this.type = value;
                        });
                      }),
                ),
              ),

              // select level
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      hint: Text('Level'),
                      value: level,
                      isExpanded: true,
                      items: levelItems.map(buildTypeItem).toList(),
                      onChanged: (value) {
                        return setState(() {
                          this.level = value;
                        });
                      }),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Text(
                DateFormat.yMMMEd().format(releaseDate),
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text(
                  'Release Date',
                ),
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                      initialDatePickerMode: DatePickerMode.day,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: releaseDate,
                      lastDate: DateTime(2100));

                  // if 'cancel' => null
                  if (selectedDate == null) {
                    setState(() {
                      releaseDate = releaseDate.add(const Duration(days: 1));
                    });
                    return;
                  }

                  // if 'OK', we got a DataTime obj
                  setState(() {
                    releaseDate = selectedDate;
                  });
                },
              ),
              // SizedBox(height: 25,),
              // Text('${time.hour} : ${time.minute.toString()=='0' ? '00':time.minute.toString()}'),
              // SizedBox(height: 10,),
              // ElevatedButton(
              //   child: Text('select time'),
              //   onPressed: () async {
              //     TimeOfDay? selectedTime = await showTimePicker(
              //
              //       context: context,
              //       initialTime: time,
              //       // firstDate: releaseDate,
              //       // lastDate: DateTime(2100)
              //     );
              //
              //
              //     if(selectedTime != null) {
              //       setState(() {
              //         time = selectedTime;
              //       });
              //       return;
              //     }
              //
              //   },
              // ),
            ],
          ),
        )),
      ),
    );
  }

  void submit() {
    final isValidFrom = formKey.currentState!.validate();

    if (isValidFrom) {
      Video video = Video(
        title: titleController.text,
        releaseDate: releaseDate,
        level: level!,
        type: type!,
        duration: int.parse(durationController.text),
        caloriesBurn: int.parse(caloryController.text),
        videoUrl: videoUrlController.text,
        thumbnailImageUrl: imageUrlController.text,
        description: descController.text

      );
      Navigator.of(context).pop(video);

      // eventNameController.clear();
    }
  }

  DropdownMenuItem<String> buildTypeItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          // style: TextStyle(fontSize: 20),
        ), // Text
      );
}
