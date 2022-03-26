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

class AddVideo extends StatefulWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
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


  List<String> levelItems = ['Easy', 'Medium', 'Hard'];
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
  Widget build(BuildContext buildContext) {
    myBuildContext = buildContext;

    // get file
    // final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);

    videoName = videoBytes != null ? videoName : 'No Video Selected';
    imageName = imageBytes != null ? imageName : 'No Image Selected';

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
              Navigator.of(buildContext).pop();
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

              // upload video
              Text(videoName!),
              ElevatedButton.icon(
                  onPressed: selectVideo,
                  icon: Icon(Icons.ondemand_video_sharp),
                  label: Text('Upload Video'),
              ),
              videoTask != null ? buildUploadStatus(videoTask!) : Container(),

              //upload image
              Text(imageName!),
              ElevatedButton.icon(
                  onPressed: selectImage,
                  icon: Icon(Icons.image_outlined),
                  label: Text('Upload Image Thumbnail'),
              ),
              imageTask != null ? buildUploadStatus(imageTask!) : Container(),

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
                    labelText: 'Video Title'),
                autofocus: true,
                controller: titleController,
                onFieldSubmitted: (_) => submit(),
                // onSubmitted: (_)=>submit(),
                // obscureText: true,
              ),

              // TextFormField(
              //   validator: (value) {
              //     if (value != null && value.length < 1) {
              //       return 'Enter the link of video';
              //     } else {
              //       return null; // the form is valid
              //     }
              //   },
              //   decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(10),
              //       hintText: '.mp4',
              //       labelText: 'Video URl'),
              //   autofocus: true,
              //   controller: videoUrlController,
              //   onFieldSubmitted: (_) => submit(),
              // ),

              // TextFormField(
              //   validator: (value) {
              //     if (value == null || value.length < 1) {
              //       return 'Enter link of image';
              //     } else {
              //       return null; // the form is valid
              //     }
              //   },
              //   decoration: InputDecoration(
              //       contentPadding: EdgeInsets.all(10),
              //       hintText: '.png, .jpg ...',
              //       labelText: 'Thumbnail Image URl'),
              //   autofocus: true,
              //   controller: imageUrlController,
              //   onFieldSubmitted: (_) => submit(),
              // ),

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
      Video video = Video(
          title: titleController.text,
          releaseDate: releaseDate,
          level: level!,
          type: type!,
          duration: int.parse(durationController.text),
          caloriesBurn: int.parse(caloryController.text),
          videoUrl: urlDownload!,
          thumbnailImageUrl: imageUrlDownload!,
          description: descController.text);
      Navigator.of(myBuildContext).pop(video);

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

  Future selectVideo() async {
    // final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    // if (result == null) return;
    // final path = result.files.single.path!;
    // setState(() => videoFile = File(path));

    // get file
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);
    if (result == null) return;
    setState(() {
      videoBytes = result.files.first.bytes;
      videoName = result.files.first.name;
      // videoFile = File('C:\Users\R510V\Downloads\The Workout _ Pencilmation Cartoon #42.mp4');


    });
    await uploadVideoFile();

    // if (result != null && result.files.isNotEmpty) {
    //   videoBytes = result.files.first.bytes;
    //   final fileName = result.files.first.name;
    //
    //   // upload file
    //   // await FirebaseStorage.instance.ref('videos/$fileName').putData(fileBytes!);
    //   await uploadVideoFile();
    // }

    // await uploadVideoFile();
  }

  Future uploadVideoFile() async {
    // videoFile = File(
    //     'C:\Users\R510V\Downloads\The Workout _ Pencilmation Cartoon #42.mp4');

    if (videoBytes == null) {
      print('Cannot find file');
      return;
    }

    // final fileName = basename(videoFile!.path);
    final destination = 'videos/$videoName';

    videoTask = FirebaseStorageApi.uploadVideoBytes(destination, videoBytes!);
    setState(() {});

    if (videoTask == null) return;

    final snapshot = await videoTask!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {});


    print('Download-Link: $urlDownload');
  }

  Future selectImage() async {
    // get file
    final result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            );
          } else {
            return Container();
          }
        },
      );
}
