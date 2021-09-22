class Login {
  String token = '';
  String role = '';

  Login({this.token, this.role});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token'],
      role: json['role'],
    );
  }
}
