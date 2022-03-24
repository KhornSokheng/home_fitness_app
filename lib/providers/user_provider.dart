import 'package:flutter/cupertino.dart';
import 'package:home_fitness/models/user.dart';

class UserProvider extends ChangeNotifier {
  User user = User(
    id: 1,
    username: 'Sabay Dee',
    role: 'admin',
    gender: 'Male',
    email: 'default@gmail.com',
    interest: ['Yoga','Muscle','Running']

  );

  final User defaultUser = User(
    id: 999,
    username: 'Default User',
    role: 'admin',
    gender: 'Male',
    email: 'default@gmail.com',
    interest: ['Muscle'],

  );

  // User user;

  // UserProvider()
  // {
  //   this.user = User(id: 1,username: 'Sabay Dee',  role: 'admin',
  //       email: 'default@gmail.com', gender: 'Male',
  //
  //   );
  //
  // }

  void updateUser(User newUserData) {
    this.user = newUserData;
    notifyListeners();
  }

  void logout() {
    this.user = defaultUser;
    notifyListeners();
  }

}
