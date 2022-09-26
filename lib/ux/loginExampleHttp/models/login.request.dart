class LoginModelRequest {
  LoginModelRequest({required this.email, required this.password});
  final String email;
  final String password;

  LoginModelRequest.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        "password": password,
      };
}
