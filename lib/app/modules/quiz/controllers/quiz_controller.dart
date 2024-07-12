import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/models/question_model.dart';
import '../../../data/service/question_service.dart';

class QuizController extends GetxController {
  var questions = <Question>[].obs;
  var currentIndex = 0.obs;
  var answers = <Option?>[].obs;
  var correctAnswers = 0.obs;
  var totalQuestions = 0.obs;
  var elapsedHours = '00'.obs;
  var elapsedMinutes = '00'.obs;
  var elapsedSeconds = '00'.obs;
  DateTime? startTime;
  Timer? _timer;

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (startTime != null) {
        var now = DateTime.now();
        var difference = now.difference(startTime!);
        elapsedHours.value = '${difference.inHours}'.padLeft(2, '0');
        elapsedMinutes.value =
            '${difference.inMinutes.remainder(60)}'.padLeft(2, '0');
        elapsedSeconds.value =
            '${difference.inSeconds.remainder(60)}'.padLeft(2, '0');
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    startTime = DateTime.now();
    startTimer();
    fetchQuestions();
  }

  void fetchQuestions() async {
    var questionList = await QuestionService().fetchQuestions();
    questions.addAll(questionList);
    answers.value = List<Option?>.filled(questions.length, null);
    totalQuestions.value = questions.length;
  }

  void setAnswer(int index, Option answer) {
    answers[index] = answer;
    calculateResults();
  }

  void selectImageAnswer(int index, Option option) {
    answers[index] = option;
    calculateResults();
  }

  void selectAnswer(int index, Option option) {
    answers[index] = option;
    calculateResults();
  }

  void calculateResults() {
    correctAnswers.value = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers[i]?.text.toLowerCase() ==
          questions[i].correctAnswer.toLowerCase()) {
        correctAnswers.value++;
      }
    }
    if (kDebugMode) {
      print('Correct answers: ${correctAnswers.value}');
    }
    if (kDebugMode) {
      print('Total questions: ${questions.length}');
    }
  }
}
