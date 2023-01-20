import 'package:flutter/material.dart';
import 'package:kampus_gratis/views/drill/component/content_result_DSA.dart';

class ResultDSAView extends StatelessWidget {
  const ResultDSAView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF106FA4), body: ContentResultDSA()),
      ),
    );
  }
}
