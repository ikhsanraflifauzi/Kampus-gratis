import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/studiku/components/content_result_quiz.dart';

class ResultQuizView extends GetView<QuizController> {
  const ResultQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF106FA4),
          body: Obx(
            () {
              if (controller.isLoading.value == true) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const LinearProgressIndicator(
                          color: Color(0xFFFDB415),
                          backgroundColor: Colors.white,
                          minHeight: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Menghitung hasil quiz",
                      style: Themes.darkTheme.textTheme.subtitle1,
                    ),
                  ],
                );
              }

              return ContentResultQuiz(controller: controller);
            },
          ),
        ),
      ),
    );
  }
}
