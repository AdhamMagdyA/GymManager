class PrivateSession {
  int id;
  String title;
  String description;
  String duration;
  String link;
  double price;
  int coachId;
  String coachName;
  PrivateSession({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.link,
    this.price,
    this.coachId,
    this.coachName,
  });

  factory PrivateSession.fromJson(Map<String, dynamic> json) {
    return PrivateSession(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      link: json['link'],
      price: json['price'],
      coachId: json['coach_id'],
      coachName: json['name'],
    );
  }
}
