class Equipment {
  String name;
  String description;
  String picture;

  Equipment({this.name, this.description, this.picture});

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
    );
  }
}
