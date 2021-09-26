class Question {
  final int id;
  final int user_id;
  final String title;
  final String body;
  final String date;
  Question({this.id, this.user_id, this.title, this.body, this.date});

  factory Question.fromJson(Map<String, dynamic> jsonData) {
    return Question(
      id: jsonData['id'],
      user_id: jsonData['user_id'],
      title: jsonData['title'],
      body: jsonData['body'],
      date: jsonData['created_at'],
    );
  }
}
