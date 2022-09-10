import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_odisha_two/features/event_setup/firebase/event_setup.dart';

final eventSetupControllerProvider = Provider(
  (ref) {
    return EventSetupController(
      eventSetup: ref.watch(eventSetupProvider),
    );
  },
);

class EventSetupController {
  final EventSetup eventSetup;

  EventSetupController({
    required this.eventSetup,
  });

  //Save Event Details To Firebase

  void saveEventDetailsToFirebase({
    required String eventName,
    required String eventId,
    required String eventLogo,
    required String eventLocation,
    required BuildContext context,
  }) {
    eventSetup.saveEventDetailsToFirebase(
      eventName: eventName,
      eventId: eventId,
      eventLogo: eventLogo,
      eventLocation: eventLocation,
      context: context,
    );
  }
}
