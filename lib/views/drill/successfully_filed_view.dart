import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class SuccesFiledDSA extends StatelessWidget {
  const SuccesFiledDSA({super.key});

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
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff15C8A8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/DSA-succes.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 37,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'Berhasil Mengajukan Simulasi',
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
                        text: 'Kamu telah mengajukan simulasi dihari',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Senin, 17 Januari 2023 jam 16:30 WIB, ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' link zoom simulasi akan dikirimkan melalui Email ',
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
