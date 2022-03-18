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
        child: Center(
          child: Text(
            'Tell us more about you'
          ),
        ),
      ),
    );
  }
}
