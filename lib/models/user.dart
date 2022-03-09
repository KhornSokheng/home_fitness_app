class User {
  final int id;
  String first_name;
  String last_name;
  String role;
  int minute_play = 0;
  int num_workout = 0;
  String user_type = 'normal'; //either normal or pro

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.role,
    // this.user_type,
  });
}