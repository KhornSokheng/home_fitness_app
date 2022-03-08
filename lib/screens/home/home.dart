import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
            'https://st2.depositphotos.com/4366957/6625/i/600/depositphotos_66253287-stock-photo-muscular-bodybuilder-guy-close-up.jpg'

            )

          ],
        ),
      ),

    );
  }
}
