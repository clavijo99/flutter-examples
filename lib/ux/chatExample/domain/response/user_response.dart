class UserResponse {
  const UserResponse(this.name, this.phone, this.password, this.image);
  final String name;
  final String phone;
  final String password;
  final String image;

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'password': password,
        'image': image,
      };
}
