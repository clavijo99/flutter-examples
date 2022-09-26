class UserModel {
  final String name;
  final String lastName;
  final String phone;
  final String address;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.address,
    required this.email,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lastName = json['last_name'],
        phone = json['phone'],
        address = json['address'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': email,
        'last_name': lastName,
        'phone': phone,
        'address': address,
        'email': email,
        'password': password,
      };
}
