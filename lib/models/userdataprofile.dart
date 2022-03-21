import 'dart:convert';
import 'userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProfile {
  static late SharedPreferences _preferences;
  static const _keyUser = 'userdataprofile';

  static UserProflie myUser = UserProflie(
    image: "https://pbs.twimg.com/media/ERY9lfSUwAIjp__.jpg",
    name: 'Test Test',
    email: 'test.test@gmail.com',
    password: 'prayuth.air27_sogood',
    phone: '(208) 206-5039',
    aboutMeDescription:
        'Runner, Yoga, Weight Lifter, world champion, Olympic Gold Medal ',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(UserProflie user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static UserProflie getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : UserProflie.fromJson(jsonDecode(json));
  }
}
