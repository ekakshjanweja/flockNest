import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack_odisha_two/common/utils/utils.dart';
import 'package:hack_odisha_two/features/authentication/screens/user_info_screen.dart';
import 'package:hack_odisha_two/models/user_model.dart';

final authProvider = Provider(
  ((ref) => Auth(
        firebaseAuth: FirebaseAuth.instance,
        firebaseFirestore: FirebaseFirestore.instance,
      )),
);

class Auth {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  Auth({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  //Sign In With Google

  Future<void> signInWithGoogle(BuildContext context) async {
    NavigatorState state = Navigator.of(context);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential)
          .whenComplete(
            () => state.pushNamed(UserInfoScreen.routeName),
          );

      // if (userCredential.credential != null) {
      //   if (userCredential.additionalUserInfo!.isNewUser) {
      //     //Sign up Processes

      //   } else {
      //     //Login Processes

      //   }
      // }
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        content: e.message!,
      );
    }
  }

  //Sign Out

  Future<void> signOut(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    NavigatorState state = Navigator.of(context);
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      state.pop();
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        content: e.message!,
      );
    }
  }

  //Get Current User Data

  Future<UserModel?> getCurrentUserData() async {
    var userData = await firebaseFirestore
        .collection('users')
        .doc(
          firebaseAuth.currentUser?.uid,
        )
        .get();

    UserModel? user;

    if (userData.data() != null) {
      user = UserModel.fromMap(
        userData.data()!,
      );
    }

    return user;
  }

  //Save User Data to Firebase

  void saveUserDataToFirebase({
    required String name,
    required BuildContext context,
  }) async {
    NavigatorState state = Navigator.of(context);
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var user = UserModel(
        name: name,
        uid: uid,
      );
      await firebaseFirestore.collection('users').doc(uid).set(user.toMap());
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        content: e.message!,
      );
    }
  }
}
