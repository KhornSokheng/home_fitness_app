import 'package:flutter/cupertino.dart';
import 'package:home_fitness/models/user.dart';

class UserProvider extends ChangeNotifier{
  User user = User(id: 1,first_name: 'Admin', last_name: 'Test', role: 'admin');

  // String cur_user;
  UserProvider(
    // {
      // this.user = User(id: 1,first_name: 'Admin', last_name: 'Test', role: 'admin'),
      // this.cur_user = 'admin'
    // }
  );

  void changeUser(String newUser){
    // cur_user = newUser;
    notifyListeners();
  }

}