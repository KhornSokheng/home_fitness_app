// import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/api/firebase_storage_api.dart';
// import 'package:home_fitness/models/event.dart';
// import 'package:home_fitness/models/video.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../bottom_menu_bar/launcher.dart';
import 'Utils.dart';

class GetInfo extends StatefulWidget {
  // const GetInfo({Key? key}) : super(key: key);

  late String email;
  // late String password;

  GetInfo({required this.email,
    // required this.password
  });

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
  List<String> genderItems = ['Male', 'Female'];

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
  String? gender;
  double weight = 60;
  double height = 170;
  List<String> interest = ['Yoga'];
  DateTime birthday = DateTime(2000, 1, 1);
  DateTime initDay = DateTime(1900, 1, 1);
  DateTime lastDay = DateTime(2100, 1, 1);

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
        child: Center(
          child: Container(
              padding: EdgeInsets.only(top: 50),
              width: 500,
              // height: 500,
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //upload image
                    Text(imageName!),
                    ElevatedButton.icon(
                      onPressed: selectImage,
                      icon: Icon(Icons.image_outlined),
                      label: Text('Upload Profile Image'),
                    ),
                    imageTask != null
                        ? buildUploadStatus(imageTask!)
                        : Container(),

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
                      maxLength: 10,
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
                          hintText: '0662344567',
                          labelText: 'Phone Number'),
                      autofocus: true,
                      controller: phoneController,
                      onFieldSubmitted: (_) => submit(),
                    ),

                    // select gender
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            hint: Text('Gender'),
                            value: gender,
                            isExpanded: true,
                            items: genderItems.map(buildTypeItem).toList(),
                            onChanged: (value) {
                              return setState(() {
                                this.gender = value;
                              });
                            }),
                      ),
                    ),

                    // select interest
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            hint: Text('You interested in'),
                            value: interest[0],
                            isExpanded: true,
                            items: typeItems.map(buildTypeItem).toList(),
                            onChanged: (value) {
                              return setState(() {
                                this.interest.add(value!);
                                print(interest);
                              });
                            }),
                      ),
                    ),

                    // select level
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Height(cm):'),
                        Expanded(
                          child: Slider(
                            value: height,
                            min: 1,
                            max: 200,
                            divisions: 199,
                            autofocus: true,
                            label: height.toString(),
                            onChanged: (newHeight) {
                              setState(() {
                                height = newHeight;
                                // print(height);
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Weight(kg):'),
                        Expanded(
                          child: Slider(
                            value: weight,
                            min: 1,
                            max: 200,
                            divisions: 199,
                            autofocus: true,
                            label: weight.toString(),
                            onChanged: (newWeight) {
                              setState(() {
                                weight = newWeight;
                                // print(height);
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    //choose date of birth
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text(
                            'Date of Birth:',
                          ),
                          onPressed: () async {
                            DateTime? selectedDate = await showDatePicker(
                                initialDatePickerMode: DatePickerMode.day,
                                context: buildContext,
                                initialDate: DateTime(2000, 1, 1),
                                firstDate: initDay,
                                lastDate: lastDay);

                            // if 'cancel' => null
                            if (selectedDate == null) {
                              setState(() {
                                // releaseDate = releaseDate.add(const Duration(days: 1));
                              });
                              return;
                            }

                            // if 'OK', we got a DataTime obj
                            setState(() {
                              birthday = selectedDate;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          DateFormat.yMMMEd().format(birthday),
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ElevatedButton(onPressed: submit, child: Text('Submit'))
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final isValidFrom = formKey.currentState!.validate();

    if (isValidFrom) {
      User user = User(
        username: usernameController.text,
        email: widget.email,
        // password: widget.password, // password should not keep in user, bc it handles by authenticaton alr
        // id: 'ID', // id will change later when referenced to the database
        id: widget.email, // use the email as the id of the document
        interest: interest,
        dateOfBirth: birthday,
        gender: gender!,
        phoneNum: phoneController.text,
        height: height,
        weight: weight,
        profile_img_url: imageUrlDownload!,
        level: level!,
      );

      try{
        // insert new user to the document
        /// Reference to user document
        final docUser = FirebaseFirestore.instance.collection('users').doc(user.id) ;

        // user.id = docUser.id;

        /// Create document and write data to Firebase
        await docUser.set(user.toJson());

        // TODO
        // update user provider
        Provider.of<UserProvider>(myBuildContext, listen: false).updateUser(user);

        Navigator.push(myBuildContext,
            MaterialPageRoute(builder: (context) {
              return Launcher(
                docId: user.id,

              );
            }));

      }on FirebaseException catch(e){
        print(e.message);

        // display error message when sth when wrong
        Utils.showSnackBar(e.message);
      }

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
