import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/api/firebase_storage_api.dart';
import 'package:home_fitness/models/event.dart';
import 'package:home_fitness/models/video.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  _GetInfoState createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  late BuildContext myBuildContext;
  DateTime releaseDate = DateTime.now();

  TimeOfDay time = TimeOfDay(hour: 17, minute: 00);

  final formKey = GlobalKey<FormState>(); //key to validate form

  Uint8List? videoBytes;
  // File? videoFile;
  String? videoName;
  String? urlDownload;

  Uint8List? imageBytes;
  String? imageName;
  String? imageUrlDownload;

  UploadTask? videoTask;
  UploadTask? imageTask;

  List<String> levelItems = ['Beginner', 'Intermediate', 'Expert'];
  final typeItems = [
    'Yoga',
    'Muscle',
    'Endurance',
    'Running',
    'Strength',
    'Aerobic',
    'Flexibility'
  ];
  String? type;
  String? level;

  late TextEditingController usernameController;
  // TextEditingController videoUrlController= TextEditingController();
  late TextEditingController videoUrlController;
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController caloryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    videoUrlController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    myBuildContext = buildContext;

    // get file
    // final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);

    videoName = videoBytes != null ? videoName : 'No Video Selected';
    imageName = imageBytes != null ? imageName : 'No Image Selected';

    return Scaffold(
      appBar: AppBar(
        title: Text('Tell Us More About You'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: 500,
          //   height: 500,
            child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              //upload image
              Text(imageName!),
              ElevatedButton.icon(
                onPressed: selectImage,
                icon: Icon(Icons.image_outlined),
                label: Text('Upload Profile Image'),
              ),
              imageTask != null ? buildUploadStatus(imageTask!) : Container(),

              TextFormField(
                validator: (value) {
                  if (value != null && value.length < 1) {
                    return 'Enter username';
                  } else {
                    return null; // the form is valid
                  }
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'EX: John Cena',
                    labelText: 'Username'),
                autofocus: true,
                controller: usernameController,
                onFieldSubmitted: (_) => submit(),
                // onSubmitted: (_)=>submit(),
                // obscureText: true,
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
                    hintText: '066 234 4567',
                    labelText: 'Phone Number'),
                autofocus: true,
                controller: phoneController,
                onFieldSubmitted: (_) => submit(),
              ),

              // select interest
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      hint: Text('You interested in'),
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
                      hint: Text('You are a '),
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
                  'Date of Birth',
                ),
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                      initialDatePickerMode: DatePickerMode.day,
                      context: buildContext,
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
            ],
          ),
        )),
      ),
    );
  }

  void submit() {
    final isValidFrom = formKey.currentState!.validate();

    if (isValidFrom) {
      // Video video = Video(
      //     title: usernameController.text,
      //     releaseDate: releaseDate,
      //     level: level!,
      //     type: type!,
      //     duration: int.parse(phoneController.text),
      //     caloriesBurn: int.parse(caloryController.text),
      //     videoUrl: urlDownload!,
      //     thumbnailImageUrl: imageUrlDownload!,
      //     description: descController.text);
      // Navigator.of(myBuildContext).pop(video);

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

  Future selectImage() async {
    // get file
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    if (result == null) return;
    setState(() {
      imageBytes = result.files.first.bytes;
      imageName = result.files.first.name;
    });
    await uploadImageFile();
  }

  Future uploadImageFile() async {
    if (imageBytes == null) {
      print('Cannot find image');
      return;
    }

    final destination = 'images/$imageName';

    imageTask = FirebaseStorageApi.uploadVideoBytes(destination, imageBytes!);
    setState(() {});

    if (imageTask == null) return;

    final snapshot = await imageTask!.whenComplete(() {});
    imageUrlDownload = await snapshot.ref.getDownloadURL();
    setState(() {});

    print('Image Download-Link: $imageUrlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            );
          } else {
            return Container();
          }
        },
      );
}
