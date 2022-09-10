// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_odisha_two/features/authentication/firebase/auth.dart';
import 'package:hack_odisha_two/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final auth = ref.watch(authProvider);
  return AuthController(auth: auth);
});

final   userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final Auth auth;
  AuthController({
    required this.auth,
  });

  //Sign In With Google

  Future<void> signInWithGoogle(BuildContext context) async {
    await auth.signInWithGoogle(context);
  }

  //Sign Out
  Future<void> singOut(BuildContext context) async {
    await auth.signOut(context);
  }

  //Save User Data to Firebase

  void saveUserDataToFirebase({
    required BuildContext context,
    required String name,
  }) async {
    auth.saveUserDataToFirebase(name: name, context: context);
  }

  //Get User Data

  Future<UserModel?> getUserData() async {
    UserModel? user = await auth.getCurrentUserData();
    return user;
  }
}
