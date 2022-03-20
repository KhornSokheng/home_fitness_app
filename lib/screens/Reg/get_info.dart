import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  _GetInfoState createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("nickname", style: TextStyle(fontSize: 20)),
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              Text("Age", style: TextStyle(fontSize: 20)),
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              Text("Weight", style: TextStyle(fontSize: 20)),
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              Text("Height", style: TextStyle(fontSize: 20)),
              TextFormField(),
              SizedBox(
                child: ElevatedButton(
                  child: Text("Next"),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
