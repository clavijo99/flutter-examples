class LoginModelResponse {
  LoginModelResponse({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.email,
  });
  final String name;
  final String lastName;
  final String phone;
  final String address;
  final String email;

  LoginModelResponse.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lastName = json['last_name'],
        phone = json['phone'],
        address = json['address'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': email,
        'last_name': lastName,
        'phone': phone,
        'address': address,
        'email': email,
      };
}
