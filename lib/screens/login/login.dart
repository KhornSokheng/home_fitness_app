import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_fitness/providers/google_sign_in.dart';
import 'package:home_fitness/screens/Reg/reg.dart';
import 'package:home_fitness/screens/menu/launcher.dart';
import 'package:provider/provider.dart';

class loginreg extends StatefulWidget {
  @override
  State<loginreg> createState() => _loginregState();
}

class _loginregState extends State<loginreg> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding;
    if(screenWidth<700){
      leftPadding = 50;
    }else{
      leftPadding = screenWidth*0.3;
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFFAAAAAA),
              Color(0xFFBBBBBB),
              Color(0xFFEEEEEE),
            ])),
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/login_logo.png'),
                    fit : BoxFit.cover,
                  )
              ),

              child: Padding(
                padding: EdgeInsets.fromLTRB(leftPadding, 120, leftPadding, 50),

                child: Container(
                  // width: 500,
                  // height: 500,
                  // color: Colors.orange,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))
                    // shape: BoxShape.circle
                  ),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 15,
                      ),
                      // Text("E-mail : ", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'example@gmail.com',
                            labelText: 'Email'
                        ),
                        autofocus: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Text("Password : ", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            // hintText: 'example@gmail.com',
                            labelText: 'Password'
                        ),
                        autofocus: true,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.white,
                            // onPrimary: Colors.black,
                            fixedSize: Size(180, 45),
                          ),
                          child: Text("Log In"),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Launcher();
                            }));
                          },
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text('OR')),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          fixedSize: Size(180, 45),
                          // minimumSize: Size(50, 50),
                        ),
                        icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                        label: Text('Log In with Google'),
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                          provider.googleLogin();
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account?",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 10)
                          ),
                          TextButton(
                              child: Text("Sign Up",

                                  style: TextStyle(
                                      fontSize: 14,
                                   decoration: TextDecoration.underline,

                              )),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return reg();
                                }));
                              },
                            ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
