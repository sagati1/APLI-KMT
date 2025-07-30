import 'package:bus_schedule_app/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class on_board2 extends StatelessWidget {
  const on_board2({super.key});

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
              color: MyColors.onboard2),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Bus Schedule Alerts ",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Get notified about bus schedules and never miss your trip.",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: LottieBuilder.asset(
                    'assets/Lotty/bus5.json',
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
