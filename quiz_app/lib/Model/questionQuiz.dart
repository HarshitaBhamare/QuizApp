class QuizQuestion {
  String questionText;
  List<String> options;
  String correctAnswer;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromMap(Map<String, dynamic> data) {
    return QuizQuestion(
      questionText: data['questionText'] ?? '',
      options: List<String>.from(data['options'] ?? []),
      correctAnswer: data['correctAns'] ?? '',
    );
  }
}
