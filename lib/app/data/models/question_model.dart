class Question {
  final String question;
  final List<Option> options;
  final String correctAnswer;
  final String imageUrl;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.imageUrl = '',
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: (json['options'] as List)
          .map((option) => Option.fromJson(option))
          .toList(),
      correctAnswer: json['correctAnswer'],
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}

class Option {
  final String text;
  final String imageUrl;

  Option({required this.text, this.imageUrl = ''});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      text: json['text'],
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
