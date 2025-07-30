import 'package:flutter/material.dart';
import 'package:bus_schedule_app/components/constant.dart';
import 'package:lottie/lottie.dart';

class on_board4 extends StatelessWidget {
  const on_board4({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.onboard4),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Ready to Go?.",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Sign up now to get started with smarter bus travel.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: LottieBuilder.asset(
                    'assets/Lotty/bus4.json',
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
