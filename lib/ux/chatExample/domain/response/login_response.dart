class LoginResponse {
  const LoginResponse(this.phone, this.password);
  final String phone;
  final String password;

  LoginResponse.fromJson(Map<String, dynamic> json)
      : phone = json['phone'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
      };
}
