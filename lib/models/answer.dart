class Answer {
  final int id;
  final int question_id;
  final int user_id;
  final String body;
  final String date;
  Answer({this.id, this.user_id, this.question_id, this.body, this.date});

  factory Answer.fromJson(Map<String, dynamic> jsonData) {
    return Answer(
      id: jsonData['id'],
      user_id: jsonData['user_id'],
      question_id: jsonData['question_id'],
      body: jsonData['body'],
      date: jsonData['updated_at'],
    );
  }
}
