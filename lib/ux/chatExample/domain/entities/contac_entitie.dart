class ContactEntitie {
  ContactEntitie(this.name, this.number);
  final String name;
  final String number;

  ContactEntitie.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        number = json['number'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
      };
}
