import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/named_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
    myFucntion();
  }

  void myFucntion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (isLoggedIn) {
          GoRouter.of(context).pushReplacement(UserRoutes.dashboard);
        } else {
          GoRouter.of(context).pushReplacement(CommonRoutes.onBoardScreen);
        }
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _controller,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Positioned.fill(
            //   child: Image.asset(
            //     'assets/images/image.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Center(
              child: SizedBox(
                width: screenWidth * 2,
                // height: screenHeight * 1.8,
                child: Image.asset(
                  'assets/kmt 24.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
