class LoginRequest {
  const LoginRequest(
    this.name,
    this.phone,
    this.image,
    this.token,
  );
  final String name;
  final String phone;
  final String image;
  final String token;

  LoginRequest.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        image = json['image'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'image': image,
        'token': token,
      };
}
