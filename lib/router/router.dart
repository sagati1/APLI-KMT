import 'package:bus_schedule_app/Screens/On_Board/on_boarding.dart';
import 'package:bus_schedule_app/Screens/ask_loginPage.dart';
import 'package:bus_schedule_app/Screens/bus_stop_details.dart';
import 'package:bus_schedule_app/Screens/dashboard_screen.dart';
import 'package:bus_schedule_app/Screens/favorites_stops.dart';
import 'package:bus_schedule_app/Screens/home_screen.dart';
import 'package:bus_schedule_app/Screens/login_screen.dart';
import 'package:bus_schedule_app/Screens/recent_trips.dart';
import 'package:bus_schedule_app/Screens/signup.dart';
import 'package:bus_schedule_app/Screens/splash_screen.dart';
import 'package:bus_schedule_app/router/named_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class MyGoRouter {
  final GoRouter router =
      GoRouter(initialLocation: CommonRoutes.splashScreen, routes: [
    GoRoute(
      path: CommonRoutes.splashScreen,
      name: CommonRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: CommonRoutes.onBoardScreen,
      name: CommonRoutes.onBoardScreen,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const on_boarding(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: UserRoutes.askLoginScreen,
      name: UserRoutes.askLoginScreen,
      builder: (context, state) => const AskLoginpage(),
    ),
    GoRoute(
      path: UserRoutes.login,
      name: UserRoutes.login,
      builder: (context, state) => const UserLogin(),
    ),
    GoRoute(
      path: UserRoutes.signUp,
      name: UserRoutes.signUp,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: UserRoutes.homeScreen,
      name: UserRoutes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: UserRoutes.dashboard,
      name: UserRoutes.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(path: UserRoutes.favoriteBusStops,
    name: UserRoutes.favoriteBusStops, 
    builder: (context, state) => FavoriteBusStops(),),

    
    GoRoute(path: UserRoutes.recentTrips,
    name: UserRoutes.recentTrips, 
    builder: (context, state) => RecentTrips(),),

    GoRoute(
      path: UserRoutes.busStopDetails,
      name: UserRoutes.busStopDetails,
      builder: (BuildContext context, GoRouterState state) {
        // Access and parse the query parameter.

        // final int id = int.parse(state.queryParameters['id']!);
        final List id = state.extra as List;

        return BusStopDetails(id: id[0], id2: id[1]);
      },
    ),
  ]);
}
