import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silengkap/app/modules/quiz/views/results_view.dart';
import '../../../data/models/question_model.dart';
import '../controllers/quiz_controller.dart';
import 'indicator_view.dart';

class QuizView extends GetView<QuizController> {
  @override
  final QuizController controller = Get.put(QuizController());

  QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: context.width,
              height: context.height,
              color: const Color(0xff00BFFF),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      'Soal Ujian Online',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Obx(() {
                if (controller.questions.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                final question =
                    controller.questions[controller.currentIndex.value];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 17, bottom: 5),
                      child: Text(
                        'Bhs.Inggris',
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(controller.elapsedHours.value),
                              const Text('Hours'),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Text(controller.elapsedMinutes.value),
                                const Text('Minutes'),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(controller.elapsedSeconds.value),
                              const Text('Seconds'),
                            ],
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: 19.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.0),
                      child: Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    if (question.imageUrl.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          question.imageUrl,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        question.question,
                        style: TextStyle(fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ...question.options.map((option) => GestureDetector(
                          onTap: () {
                            if (option.imageUrl.isNotEmpty) {
                              controller.selectImageAnswer(
                                  controller.currentIndex.value, option);
                            } else {
                              controller.setAnswer(
                                  controller.currentIndex.value, option);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                              color: controller.answers[
                                          controller.currentIndex.value] ==
                                      option
                                  ? Colors.green
                                  : Colors.white,
                            ),
                            child: Row(
                              children: [
                                if (option.imageUrl.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      option.imageUrl,
                                      width: 150.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Expanded(
                                  child: Text(
                                    option.text,
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: controller.currentIndex.value > 0
                              ? () => controller.currentIndex.value--
                              : null,
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11.0),
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff0496FF),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                '${controller.currentIndex.value + 1}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.currentIndex.value <
                                  controller.questions.length - 1
                              ? () => controller.currentIndex.value++
                              : null,
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 75.0, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(IndicatorView());
                            },
                            child: Container(
                              height: 35.h,
                              width: 145.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff0496FF),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.menu_book_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Question',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.currentIndex.value ==
                              controller.questions.length - 1)
                            GestureDetector(
                              onTap: () {
                                bool allAnswered = true;
                                for (Option? answer in controller.answers) {
                                  if (answer == null) {
                                    allAnswered = false;
                                    break;
                                  }
                                }
                                if (allAnswered) {
                                  Get.to(const ResultsView());
                                } else {
                                  Get.snackbar(
                                    'Tunggu',
                                    'Selesaikan Semua Soal Terlebih Dahulu.',
                                    snackPosition: SnackPosition.TOP,
                                    duration: const Duration(seconds: 3),
                                  );
                                }
                              },
                              child: Container(
                                height: 35.h,
                                width: 145.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff0496FF),
                                ),
                                child: Center(
                                  child: Text(
                                    'Finished',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
