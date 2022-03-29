import 'package:flutter/material.dart';
import 'package:home_fitness/screens/Reg/get_info.dart';
import 'package:home_fitness/screens/Reg/sign_up.dart';
import 'package:home_fitness/screens/login/login.dart';

class reg extends StatelessWidget {
  const reg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'John',
                    labelText: 'First Name'),
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Cena',
                    labelText: 'Last Name'),
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'example@gmail.com',
                    labelText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    // hintText: 'example@gmail.com',
                    labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return GetInfo();
              //     }));
              //   },
              //   child: Text(
              //     'Sign Up(JR)',
              //   ),
              // ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUp();
                  }));
                },
                child: Text(
                  'Sign Up(Nont)',
                ),
              ),

              //Form(),
            ],
          ),
        ),
      ),
    );
  }
}
