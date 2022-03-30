import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/models/userprofile.dart';
import 'package:home_fitness/models/userdataprofile.dart';
import 'package:home_fitness/providers/google_sign_in.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/profile/edit_password.dart';
import 'package:home_fitness/widgets/display_image_widget.dart';

import 'package:home_fitness/screens/profile/edit_desc.dart';
import 'package:home_fitness/screens/profile/edit_name.dart';
import 'package:home_fitness/screens/profile/edit_email.dart';
import 'package:home_fitness/screens/profile/edit_img.dart';
import 'package:home_fitness/screens/profile/edit_phone.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../admin/admin_report.dart';
//import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final userdataprofile = UserDataProfile.myUser;
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Visibility(
          visible: user.role=='admin',
          child: IconButton(
            tooltip: 'admin report',
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: FaIcon(FontAwesomeIcons.receipt),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AdminReport();
              }));
            },
          ),
        ),
        title: Text("Profile"),
        centerTitle: true,
        // backgroundColor: Colors.grey,
        actions: [
          Flexible(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 5, 20, 5),
              child: ElevatedButton.icon(
                onPressed: () {
                  user.logout();
                  final googleUserProvider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  googleUserProvider.logout();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                icon: Icon(Icons.logout),
                label: Text('Log Out'),
                // child: Text('logout'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            width: 500,
            // color: Colors.orange[50],
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: 10,
                ),
                InkWell(
                    onTap: () {
                      navigateSecondPage(EditImagePage());
                    },
                    child: DisplayImage(
                      // imagePath: userdataprofile.image,
                      imagePath: user.profile_img_url,
                      onPressed: () {},
                    )),
                buildUserInfoDisplay(
                    // userdataprofile.name, '', EditNameFormPage()),
                    user.username,
                    'Name',
                    EditNameFormPage(),
                    true),
                buildUserInfoDisplay(
                    user.email, 'Email', EditEmailFormPage(), false),
                buildUserInfoDisplay(
                    user.phoneNum, 'Phone', EditPhoneFormPage(), true),

                // buildUserInfoDisplay(
                //     user.password, 'Password', EditPasswordFormPage(), true),
                buildUserInfoDisplay(user.get_obesity_status(), 'BMI Status',
                    EditNameFormPage(), false),
                buildUserInfoDisplay(user.height.toString(), 'Height(cm)',
                    EditNameFormPage(), false),
                Slider(
                  value: user.height,
                  min: 1,
                  max: 200,
                  divisions: 199,
                  autofocus: true,
                  label: user.height.toString(),
                  onChanged: (newHeight) {
                    setState(() {
                      user.height = newHeight;
                      print(user.height);
                    });
                  },
                ),
                buildUserInfoDisplay(user.weight.toString(), 'Weight(kg)',
                    EditNameFormPage(), false),
                Slider(
                  value: user.weight,
                  min: 1,
                  max: 200,
                  divisions: 199,
                  autofocus: true,
                  label: user.weight.toString(),
                  onChanged: (newWeight) {
                    setState(() {
                      user.weight = newWeight;
                      print(user.weight);
                    });
                  },
                ),

                SizedBox(
                  height: 150,
                )

                // Expanded(
                //   child: buildAbout(userdataprofile),
                //   flex: 4,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserInfoDisplay(
          String getValue, String title, Widget editPage, bool editable) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 500,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              if (editable) {
                                navigateSecondPage(editPage);
                              }
                            },
                            child: Text(
                              title == 'Password'
                                  ? 'Click to change your password'
                                  : getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    Visibility(
                      visible: editable,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(UserProflie user) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user.aboutMeDescription,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.0,
                                  ),
                                ))))),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
