import 'package:bus_schedule_app/components/constant.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AskLoginpage extends StatelessWidget {
  const AskLoginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                width: double.infinity,
                // child: Image.asset(
                //   "assets/images/ACADEMICVERSE.png",
                //   fit: BoxFit.fitHeight,
                // ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(UserRoutes.signUp);
                },
                child: Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        height: 30,
                      ),
                      Text(
                        "Sign Up To Join US!",
                        style: GoogleFonts.abyssinicaSil(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Not Joined us Yes? ",
                style: GoogleFonts.abyssinicaSil(fontSize: 16),
              ),
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Text(
                "You're One Stop solution for all your\n Financial guidance.",
                style: GoogleFonts.abyssinicaSil(fontSize: 17), textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  print("Navigate to the Alumni Page Further Page");
                  GoRouter.of(context).pushNamed(UserRoutes.login);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: MyColors.ourPrimary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign-In ",
                          style: GoogleFonts.abyssinicaSil(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wanna know more about us? ",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   GoRouter.of(context)
                    //       .pushNamed(CommonRoutes.collegeIdLogin);
                    // },
                    child: Text(
                      "Click.",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
