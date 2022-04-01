import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_fitness/providers/google_sign_in.dart';
import 'package:home_fitness/screens/sign_up/Utils.dart';
import 'package:home_fitness/screens/sign_up/get_info.dart';
import 'package:home_fitness/screens/sign_up/reg.dart';
import 'package:home_fitness/screens/login/custom_clip_path.dart';
import 'package:home_fitness/screens/bottom_menu_bar/launcher.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import '../login/login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   // emailController = TextEditingController();
  //   // passwordController = TextEditingController();
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding;
    if (screenWidth < 700) {
      leftPadding = 50;
    } else {
      leftPadding = screenWidth * 0.3;
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //         colors: [
        //       Color(0xFFE52929),
        //       Color(0xFF3E7BEC),
        //       Color(0xFFEEEEEE),
        //     ])),
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/login_logo.png'),
                    fit: BoxFit.cover,
                  )),
              child: Padding(
                padding: EdgeInsets.fromLTRB(leftPadding, 120, leftPadding, 50),
                child: Container(
                  decoration: BoxDecoration(
                    // border: Border.all(),
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    // shape: BoxShape.circle
                  ),
                  child: Column(
                    // clipBehavior: Clip.antiAlias,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // border: Border.all(),
                              color: Colors.orange[100],
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))
                            // shape: BoxShape.circle
                          ),

                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(20)),
                          //     gradient: LinearGradient(
                          //         begin: Alignment.topLeft,
                          //         end: Alignment.bottomRight,
                          //         colors: [
                          //           Color(0xFFE52929),
                          //           Color(0xFF3E7BEC),
                          //           Color(0xFFEEEEEE),
                          //         ])),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText('Home Fitness - Sign Up',
                                maxLines: 2,
                                maxFontSize: 30,
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // Text("E-mail : ", style: TextStyle(fontSize: 20)),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'example@gmail.com',
                                    labelText: 'Email'),
                                autofocus: true,
                                validator: (value) {
                                  if (value == null ||
                                      // value.length < 1 ||
                                      !EmailValidator.validate(value)) {
                                    return 'Enter a valid email';
                                  } else {
                                    return null; // the form is valid
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Text("Password : ", style: TextStyle(fontSize: 20)),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    // hintText: 'example@gmail.com',
                                    labelText: 'Password'),
                                autofocus: true,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return 'Enter a password (at least 6 characters)';
                                  } else {
                                    return null; // the form is valid
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    // primary: Colors.white,
                                    // onPrimary: Colors.black,
                                    fixedSize: Size(180, 45),
                                  ),
                                  label: Text("Sign Up"),
                                  onPressed: signUpEmailPassword,
                                  icon: FaIcon(FontAwesomeIcons.arrowRight,
                                      color: Colors.white),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an Account?",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  TextButton(
                                    child: Text("Log In",
                                        style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        )),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return LogIn();
                                          }));
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 250,
                            // color: Colors.orange,
                            decoration: BoxDecoration(
                              // border: Border.all(),
                                color: Colors.orange[100],
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))
                              // shape: BoxShape.circle
                            ),

                            child: CustomPaint(
                              painter: RPSCustomPainter(),

                              size: Size(
                                  screenWidth,
                                  (screenWidth * 0.5833333333333334)
                                      .toDouble()),
                              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              // clipper: CustomClipPath(),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUpEmailPassword() async {
    final isValidFrom = formKey.currentState!.validate();

    if (isValidFrom) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return GetInfo(
                email: emailController.text.trim(),
                // password: passwordController.text.trim(),
              );
            }));

      }on FirebaseAuthException catch (e){
        print(e);

        // display error message when sth when wrong with the email or password
        Utils.showSnackBar(e.message);

      }
    }
  }
}
