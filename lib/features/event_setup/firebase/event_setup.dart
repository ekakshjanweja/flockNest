import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_odisha_two/common/utils/utils.dart';
import 'package:hack_odisha_two/models/event_model.dart';

final eventSetupProvider = Provider((ref) {
  return EventSetup(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  );
});

class EventSetup {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  EventSetup({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  //Save Event Details To Firebase

  void saveEventDetailsToFirebase({
    required String eventName,
    required String eventId,
    required String eventLogo,
    required String eventLocation,
    required BuildContext context,
  }) async {
    NavigatorState state = Navigator.of(context);
    try {
      String uid = firebaseAuth.currentUser!.uid;

      var event = EventModel(
        eventName: eventName,
        eventId: eventId,
        eventLogo: eventLogo,
        eventLocation: eventLocation,
      );

      await firebaseFirestore
          .collection('events')
          .doc(uid + eventId)
          .set(event.toMap());
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        content: e.message!,
      );
    }
  }
}
