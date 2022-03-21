import 'package:flutter/cupertino.dart';
import 'package:home_fitness/models/user.dart';

class UserProvider extends ChangeNotifier {
  User user = User(
    id: 1,
    username: 'Nont',
    // last_name: 'Sabay',
    role: 'admin',
    gender: 'Male',
    email: 'default@gmail.com',
    // heartRate: 110,
  );

  // String cur_user;
  UserProvider(

      // {
      // this.user = User(id: 1,username: 'Admin',  role: 'admin'),
      // this.cur_user = 'admin'
      // }
      );

  void updateUser(User newUserData) {
    this.user = newUserData;
    notifyListeners();
  }
}
