import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';

class ResultsView extends GetView<QuizController> {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final scorePercentage =
          (controller.correctAnswers.value / controller.questions.length * 100)
              .round();
      final isLowScore = scorePercentage < 40;

      return Scaffold(
        backgroundColor:
            isLowScore ? const Color(0xffFC1D1F) : const Color(0xff00BFFF),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Hasil Ujian',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 45),
                child: Center(
                  child: Image.asset(
                    isLowScore
                        ? 'assets/images/Cry.png'
                        : 'assets/images/Happy.png',
                  ),
                ),
              ),
              Center(
                child: Text(
                  isLowScore ? 'Let\'s try Again!' : 'You did it !',
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 21.0, bottom: 28),
                child: Center(
                  child: Text(
                    isLowScore
                        ? '"You have worked hard for this exam, so keep up your enthusiasm."'
                        : '“You really show that hard work has rewarding results."',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Container(
                  height: 226.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0, bottom: 25),
                        child: Center(
                          child: Text(
                            'Your Score',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22.0),
                        child: Text(
                          '$scorePercentage',
                          style: TextStyle(
                            fontSize: 64.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          height: 45.h,
                          width: context.width,
                          decoration: BoxDecoration(
                            color: const Color(0xff0496FF),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Value Detail',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 39.h,
                      width: 132.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'True : ${controller.correctAnswers.value}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      height: 40.h,
                      width: 132.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'False : ${controller.totalQuestions.value - controller.correctAnswers.value}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
