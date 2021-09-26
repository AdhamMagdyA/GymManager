class Questions {
  final List<dynamic> questions;
  Questions({this.questions});
  factory Questions.fromJson(Map<String, dynamic> jsonData) {
    return Questions(
      questions: jsonData['questions'],
    );
  }
}
