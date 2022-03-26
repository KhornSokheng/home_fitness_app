import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/home/purchase.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Text(
                // 'Welcome ${user.first_name + ' ' + user.last_name}',
                'Welcome To Home Fitness',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 60,
                  fontFamily: 'RussoOne',
                ),
              ),
              Image.asset(
                'assets/Fitnss_logo.png',
                width: 500,
                height: 500,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Purchase();
                  }));
                },
                child: Text(
                  'Update to Pro',
                  style: TextStyle(
                    // color: Colors.orangeAccent,
                    // fontSize: 60,
                    fontFamily: 'RussoOne',
                  ),
                ),
              ),
              /* Image.network(
                  'https://st2.depositphotos.com/4366957/6625/i/600/depositphotos_66253287-stock-photo-muscular-bodybuilder-guy-close-up.jpg'),*/
              // Expanded(
              //   child: Container(
              //     height: 300,
              //     color: Colors.black12,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
