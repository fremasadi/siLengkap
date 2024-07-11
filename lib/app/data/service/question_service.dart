import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import '../models/question_model.dart';

class QuestionService {
  Future<List<Question>> fetchQuestions() async {
    String jsonString = await rootBundle.loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(jsonString);

    List<Question> questions = jsonList.map((json) {
      List<Option> options = List<Option>.from(
        json['options'].map((option) => Option(
              text: option['text'],
              imageUrl: option['imageUrl'],
            )),
      );
      return Question(
        question: json['question'],
        options: options,
        correctAnswer: json['correctAnswer'],
        imageUrl: json['imageUrl'],
      );
    }).toList();

    return questions;
  }
}
