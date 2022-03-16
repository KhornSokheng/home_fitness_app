import 'package:flutter/material.dart';
import 'package:home_fitness/screens/login/login.dart';

class reg extends StatelessWidget {
  const reg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              '   Create Account',
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 10,
            ),
            Form(),
          ],
        ),
      ),
    );
  }
}
