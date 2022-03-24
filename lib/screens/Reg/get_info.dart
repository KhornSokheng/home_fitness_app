import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  _GetInfoState createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(150),
        child: Form(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Choose aptitude',
                style: TextStyle(fontSize: 35, fontFamily: 'BebasNeue'),
              ),
              Text("How often do you exercise.",
                  style: TextStyle(fontSize: 20, fontFamily: 'BebasNeue')),
              SizedBox(),
              Text("Have you used an exercise program before.",
                  style: TextStyle(fontSize: 20, fontFamily: 'BebasNeue')),
              TextFormField(),
              SizedBox(),
              Text("How much are you interested in exercising.",
                  style: TextStyle(fontSize: 20, fontFamily: 'BebasNeue')),
              TextFormField(),
              SizedBox(),
              Text("What is your interest in exercise.",
                  style: TextStyle(fontSize: 20, fontFamily: 'BebasNeue')),
              TextFormField(),
              SizedBox(),
              Text("how disciplined you are",
                  style: TextStyle(fontSize: 20, fontFamily: 'BebasNeue')),
              TextFormField(),
              SizedBox(),
            ]),
          ),
        ),
      ),
    );
  }
}
