class User {
  final int id;
  String first_name;
  String last_name;
  String role;
  int minute_play = 100;
  int num_workout = 5;
  String user_type = 'normal'; //either normal or pro

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.role,
    // required this.user_type,
  });
}