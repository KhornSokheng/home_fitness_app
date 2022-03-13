import 'dart:math';

class User {
  final int id;
  String first_name;
  String last_name;
  DateTime? dateOfBirth = DateTime(2000,1,1);
  String? role = 'user'; // either user or admin???
  int minute_play = 100;
  int num_workout = 5;
  String? user_type = 'normal'; //either normal or pro
  double? height=173; // height in cm
  double? weight = 75; // weight in kg
  String gender = 'Male';
  int? heartRate;
  int? step;
  int? calories_burn = 1100;
  double? distance_walk; // in KM


  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.gender,
    this.role,
    this.user_type,
    this.height,
    this.weight,
    this.dateOfBirth,
    this.calories_burn,
    this.heartRate = 95,
    this.step = 1980,
    this.distance_walk  = 2,

  });

  double compute_bmi(){
    double height_m = height!/100;
    return weight!/(height_m*height_m);
  }

  String get_obesity_status(){
    double bmi = compute_bmi();
    if(bmi<18.5) return 'Underweight';
    else if(bmi<25) return 'Normal';
    else return 'Overweight';
  }

  //function to random some activities' data
  void generateData(){
    this.step = Random().nextInt(2000)+2000;
    this.heartRate = Random().nextInt(40)+80;
    this.calories_burn = Random().nextInt(500)+1000;
    this.distance_walk = (this.step!/1300);
  }
}