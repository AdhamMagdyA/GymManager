class Equipment {
  int id;
  String name;
  String description;
  String picture;

  Equipment({this.id, this.name, this.description, this.picture});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
    );
  }
}
