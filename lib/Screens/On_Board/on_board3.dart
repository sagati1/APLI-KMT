import 'package:flutter/material.dart';
import 'package:bus_schedule_app/components/constant.dart';
import 'package:lottie/lottie.dart';

class on_board3 extends StatelessWidget {
  const on_board3({super.key});

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
              color: MyColors.onboard3),
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
                  "Smart Schedule.",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Access bus schedules, routes, and arrival times at your fingertips.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: LottieBuilder.asset(
                    'assets/Lotty/bus3.json',
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
