import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class User {
  final int id;
  String username;
  String email;
  // String last_name;
  String password;
  DateTime? dateOfBirth = DateTime(2000, 1, 1);
  String? role = 'normal_user'; // either normal_user or admin???
  int minute_play = 100;
  int num_workout = 5;
  String? user_type = 'normal'; //either normal or pro
  double height; // height in cm
  double weight; // weight in kg
  String gender;
  int? heartRate;
  int? step;
  int? calories_burn = 1100;
  double? distance_walk; // in KM
  String profile_img_url;
  String phoneNum;
  List<String> interest;
  String level;

  User({
    required this.id,
    required this.username,
    required this.email,
    // required this.last_name,
    this.password = 'password',
    this.gender = 'Male',
    this.role,
    this.phoneNum = '(66) 205-9099',
    this.user_type,
    this.height = 175,
    this.weight = 75,
    this.dateOfBirth,
    this.calories_burn,
    this.heartRate = 95,
    this.step = 1980,
    this.distance_walk = 2,
    this.profile_img_url =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Y2LJnaCmGkiNXrQ9BDNoWPljvdLT1308iw&usqp=CAU',
    required this.interest,
    this.level = 'Beginner',
  });

  // to json method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
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
      'distance_walk': distance_walk,
    };
  }

  //convert from json obj to User
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        gender: json['gender'],
        role: json['role'],
        phoneNum: json['phoneNum'],
        user_type: json['user_type'],
        height: json['height'],
        weight: json['weight'],
        dateOfBirth: json['dateOfBirth'],
        profile_img_url: json['profile_img_url'],
        interest: json['interest'],
        level: json['level'],
        calories_burn: json['calories_burn'],
        step: json['step'],
        distance_walk: json['distance_walk'],
      );

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
    this.calories_burn = Random().nextInt(500) + 1000;
    this.distance_walk = (this.step! / 1300);
  }

  void logout() {}

  Future<void> getUser() async {
    // var url = Uri.parse('https://example.com/whatsit/create');
    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // http.Response response = await http.get(Uri.parse('localhost:5000/getCustomer'));
    //
    // Map data = jsonDecode(response.body);
    // print(data);
    //
    // print('hello world');
    // print(await http.read(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/madrid')));
  }
}
