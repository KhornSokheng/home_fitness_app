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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://s.isanook.com/he/0/rp/rc/w700h366/yacxacm1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL2hlLzAvdWQvMC8yNDczL3J1bm5pbmdfMS5qcGc=.jpg",
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  // fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 15,
                ),
                Text("E-mail : ", style: TextStyle(fontSize: 20)),
                TextFormField(),
                SizedBox(
                  height: 15,
                ),
                Text("Password : ", style: TextStyle(fontSize: 20)),
                TextFormField(
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
    );
  }
}
