import 'package:flutter/material.dart';
import 'package:kampus_gratis/controllers/studiku/quiz_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

class ContentResultDSA extends StatefulWidget {
  const ContentResultDSA({
    super.key,
    this.controller,
  });

  final QuizController? controller;

  @override
  State<ContentResultDSA> createState() => _ContentResultDSAState();
}

class _ContentResultDSAState extends State<ContentResultDSA>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween(begin: 0.5, end: 1.0).animate(animController);

    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Nilai simulasi kamu',
              style: Themes.darkTheme.textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF1C87C3),
                  radius: 90,
                ),
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 10,
                  percent: 0.1,
                  backgroundColor: const Color(0xFF16D3FD),
                  linearGradient: const LinearGradient(
                    colors: [
                      Color(0xFFFDB415),
                      Color(0xFFE5F52F),
                      Color(0xFF16D3FD),
                    ],
                    stops: [0.3, 0.6, 0.9],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  animation: true,
                  animationDuration: 2000,
                  curve: Curves.easeIn,
                  center: Text(
                    "10",
                    style: Themes.darkTheme.textTheme.subtitle1!.copyWith(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 29,
                left: 25,
                right: 25,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Nama',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Jimmy Soedibjoe',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Semester',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 87,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            '2 (2022-2023)',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Program Studi',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 55,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'POB',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Mata kuliah',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 72,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Accounting 1',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Waktu pelaksanaan',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Senin, 17 Agustus 2022 ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Dosen Penguji',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 53,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Bambang Sutiyoso S.Ak',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Nilai diperoleh',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 53,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            '90/100',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 41,
                      width: 200,
                      margin: const EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        color: const Color(0xff106FA4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Selesai',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
