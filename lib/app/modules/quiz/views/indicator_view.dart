import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    'Review Soal',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text('00'),
                        Text('Hours'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: const [
                          Text('00'),
                          Text('Minutes'),
                        ],
                      ),
                    ),
                    Column(
                      children: const [
                        Text('00'),
                        Text('Second'),
                      ],
                    )
                  ],
                ),
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
                        'answers',
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
                              color: controller.answers[index] == null
                                  ? Colors.orangeAccent
                                  : Colors.green,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
