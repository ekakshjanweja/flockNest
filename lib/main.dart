import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_odisha_two/common/widgets/error_screen.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/features/authentication/controllers/auth_controller.dart';
import 'package:hack_odisha_two/features/authentication/screens/login_screen.dart';
import 'package:hack_odisha_two/features/authentication/screens/user_info_screen.dart';
import 'package:hack_odisha_two/firebase_options.dart';
import 'package:hack_odisha_two/router.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: primaryColor,
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
      ),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user != null) {
                return const UserInfoScreen();
              } else {
                return const LoginScreen();
              }
            },
            error: (error, stackTrace) => ErrorScreen(
              error: error.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
