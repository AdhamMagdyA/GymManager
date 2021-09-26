class Answers {
  final List<dynamic> answers;
  Answers({this.answers});
  factory Answers.fromJson(Map<String, dynamic> jsonData) {
    return Answers(
      answers: jsonData['answers'],
    );
  }
}
