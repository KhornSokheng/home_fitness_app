import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class User {
  String id;
  String username;
  String email;
  String password;
  DateTime? dateOfBirth = DateTime(2000, 1, 1);
  String? role = 'normal_user'; // either normal_user or admin???
  int minute_play = 60;
  int num_workout = 12;
  String? user_type = 'normal'; //either normal or pro
  double height; // height in cm
  double weight; // weight in kg
  String gender;
  int? heartRate;
  int? step;
  int calories_burn;
  double? distance_walk; // in KM
  String profile_img_url;
  String phoneNum;
  List<String> interest;
  String level;

  User(
      {required this.id,
      required this.username,
      required this.email,
      // required this.last_name,
      this.password = 'password',
      this.gender = 'Male',
      this.role = 'normal_user',
      this.phoneNum = '0932059099',
      this.user_type = 'normal',
      this.height = 175.0,
      this.weight = 75.0,
      this.dateOfBirth,
      this.calories_burn = 0,
      this.heartRate = 95,
      this.step = 1980,
      this.distance_walk = 2,
      this.profile_img_url =
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Y2LJnaCmGkiNXrQ9BDNoWPljvdLT1308iw&usqp=CAU',
      required this.interest,
      this.level = 'Beginner',
      this.minute_play = 0,
      this.num_workout = 0});

  // to json method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      // 'password': password,
      'gender': gender,
      'role': role,
      'phoneNum': phoneNum,
      'user_type': user_type,
      'height': height,
      'weight': weight,
      'dateOfBirth': dateOfBirth,
      'profile_img_url': profile_img_url,
      'interest': interest,
      'level': level,
      'calories_burn': calories_burn,
      'step': step,
      'distance_walk': distance_walk as double,
      'num_workout': num_workout,
      'minute_play': minute_play
    };
  }

  //convert from json obj to User
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      // password: json['password'],
      gender: json['gender'],
      role: json['role'],
      phoneNum: json['phoneNum'],
      user_type: json['user_type'],
      height: json['height'].toDouble(),
      weight: json['weight'].toDouble(),
      dateOfBirth: (json['dateOfBirth'] as Timestamp).toDate(),
      profile_img_url: json['profile_img_url'],
      interest: json['interest'].cast<String>(),
      // interest: ['Yoga'],
      level: json['level'],
      calories_burn: json['calories_burn'],
      step: json['step'],
      distance_walk: json['distance_walk'].toDouble(),
      num_workout: json['num_workout'],
      minute_play: json['minute_play']);

  String getVieoLevel() {
    if (this.level == 'Beginner')
      return 'Easy';
    else if (this.level == 'Intermediate')
      return 'Medium';
    else
      return 'Hard';
  }

  double compute_bmi() {
    double height_m = height / 100;
    return weight / (height_m * height_m);
  }

  String get_obesity_status() {
    double bmi = compute_bmi();
    if (bmi < 18.5)
      return 'Underweight';
    else if (bmi < 25)
      return 'Normal';
    else
      return 'Overweight';
  }

  //function to random some activities' data
  void generateData() {
    this.step = Random().nextInt(2000) + 2000;
    this.heartRate = Random().nextInt(40) + 80;
    // this.calories_burn = Random().nextInt(500) + 1000;
    this.distance_walk = (this.step! / 1300);
  }

  void logout() {}

  Future<void> getUser() async {}
}
