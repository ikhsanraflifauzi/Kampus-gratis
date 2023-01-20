import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class ReschedlueFiledView extends StatelessWidget {
  const ReschedlueFiledView({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 81,
        bottom: 33,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/icons/schedule_clock.png',
                ),
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/DSA-schedule.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 37,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'Reschedule Jadwal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 16),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: 'Kamu telah mengajukan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Reschedule ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text:
                                '  jadwal pertemuan simulasi, silakan menunggu jadwal simulasi terbaru. ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
            Container(
              height: 41,
              width: 189,
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
            )
          ],
        ),
      ),
    ));
  }
}
