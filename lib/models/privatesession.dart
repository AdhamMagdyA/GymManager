class PrivateSession {
  int id;
  String title;
  String description;
  String duration;
  String link;
  double price;
  int coachId;
  String coachName;
  String status;
  String memberName;
  String dateTime;
  String name;

  PrivateSession({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.link,
    this.price,
    this.coachId,
    this.coachName,
    this.status,
    this.memberName,
    this.dateTime,
    this.name,
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
  factory PrivateSession.fromJsonwithDate(Map<String, dynamic> json) {
    return PrivateSession(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      link: json['link'],
      price: json['price'],
      coachId: json['coach_id'],
      status: json['status'],
      dateTime: json['datetime'] ?? '',
      name: json['name'],
    );
  }
  factory PrivateSession.fromJsonAdmin(Map<String, dynamic> json) {
    return PrivateSession(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      link: json['link'],
      price: json['price'],
      coachId: json['coach_id'],
      status: json['status'],
      memberName: json['name'],
    );
  }
}
