import 'package:flutter/material.dart';
import 'package:home_fitness/screens/achievement/achievement.dart';
import 'package:home_fitness/screens/admin/admin_report.dart';
import 'package:home_fitness/screens/home/home.dart';
import 'package:home_fitness/screens/login/login.dart';
import 'package:home_fitness/screens/menu/launcher.dart';
import 'package:home_fitness/screens/notification/notification.dart';

<<<<<<< HEAD
import 'login/login.dart';

=======
>>>>>>> 025ff1e651a95192da2566073943e68f06a17355
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Launcher();
    return LoginOrMenu();
  }
}

class LoginOrMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return loginreg();
                }));
              },
              child: Text('Login Test')),
          SizedBox(
            width: 100,
          ),
          ElevatedButton(
              onPressed: () {
                // MaterialPageRoute(builder: (BuildContext context) {
                //   return Launcher();
                // });
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Launcher();
                }));
              },
              child: Text('Go to Menu')),
          SizedBox(
            width: 100,
          ),
          ElevatedButton(
              onPressed: () {
                // MaterialPageRoute(builder: (BuildContext context) {
                //   return Launcher();
                // });
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
<<<<<<< HEAD
                  return Achievement();
                }));
              },
              child: Text('Nont'))
=======
                  return AdminReport();
                }));
              },
              child: Text('Log in as Admin'))
>>>>>>> 025ff1e651a95192da2566073943e68f06a17355
        ],
      ),
    );
  }
}
