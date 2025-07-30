import 'package:bus_schedule_app/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class on_board1 extends StatelessWidget {
  const on_board1({super.key});

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
              color: MyColors.onboard1),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Welcome to BusTracker!",
                  softWrap: true,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your real-time companion for hassle-free bus travel!",
                  softWrap: true,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: LottieBuilder.asset(
                    'assets/Lotty/bus1.json',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
