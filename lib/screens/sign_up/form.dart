import 'package:flutter/material.dart';

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Full Name'),
        buildInputForm('Email'),
        buildInputForm('Password'),
        buildInputForm('Confirm Password'),
      ],
    );
  }
}

Padding buildInputForm(String hint) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      decoration: InputDecoration(hintText: hint),
    ),
  );
}
