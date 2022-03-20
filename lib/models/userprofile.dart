class UserProflie {
  String image;
  String name;
  String email;
  String password;
  String phone;
  String aboutMeDescription;

  // Constructor
  UserProflie({
    required this.image,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.aboutMeDescription,
  });

  UserProflie copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? about,
  }) =>
      UserProflie(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? this.aboutMeDescription,
      );

  static UserProflie fromJson(Map<String, dynamic> json) => UserProflie(
        image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        aboutMeDescription: json['about'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': image,
        'name': name,
        'email': email,
        'password': password,
        'about': aboutMeDescription,
        'phone': phone,
      };
}
