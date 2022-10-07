class UserRequest {
  const UserRequest(
    this.name,
    this.phone,
    this.image,
  );
  final String name;
  final String phone;
  final String image;

  UserRequest.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'image': image,
      };
}
