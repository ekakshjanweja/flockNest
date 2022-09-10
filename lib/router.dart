import 'package:flutter/material.dart';
import 'package:hack_odisha_two/common/widgets/error_screen.dart';
import 'package:hack_odisha_two/features/authentication/screens/login_screen.dart';
import 'package:hack_odisha_two/features/authentication/screens/signup_screen.dart';
import 'package:hack_odisha_two/features/authentication/screens/user_info_screen.dart';
import 'package:hack_odisha_two/features/event_setup/screens/host_screen.dart';
import 'package:hack_odisha_two/features/event_setup/screens/qr_generated.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    case SignupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );
    case UserInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInfoScreen(),
      );
    case HostScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HostScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist.'),
        ),
      );
  }
}
