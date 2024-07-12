import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:silengkap/app/modules/quiz/views/results_view.dart';
import '../../../data/models/question_model.dart';
import '../controllers/quiz_controller.dart';

class IndicatorView extends GetView<QuizController> {
  @override
  final QuizController controller = Get.find();

  IndicatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: const Color(0xff00BFFF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50, horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      Text(
                        'Review Soal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 130),
            height: context.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Divider(
                    height: 2.h,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 22.0, bottom: 11.0, left: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xff099752),
                        radius: 12.sp,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Answers',
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xff099752)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 11.0, bottom: 11.0, left: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xffE3A70C),
                        radius: 12.sp,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'haven\'t answered',
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xff099752)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          childAspectRatio: 1,
                        ),
                        itemCount: controller.questions.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.currentIndex.value = index;
                              Get.back();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: controller.answers[index] == null
                                    ? const Color(0xffE3A70C)
                                    : const Color(0xff099752),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                ),
                              ),
                              child: Center(
                                child: Text((index + 1).toString()),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 27.0, right: 27.0, bottom: 31.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40.h,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: const Color(0xff0496FF),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: TextButton(
                        onPressed: () {
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
                        child: Text(
                          'Submit Test',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
