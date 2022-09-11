import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_odisha_two/common/widgets/custom_button.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/constants/custom_text.dart';
import 'package:hack_odisha_two/features/event_setup/controller/event_setup_controller.dart';
import 'package:hack_odisha_two/features/event_setup/screens/qr_generated.dart';

class HostScreen extends ConsumerWidget {
  static const routeName = '/host-screen';
  const HostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController eventNameController = TextEditingController();
    TextEditingController eventIdController = TextEditingController();
    TextEditingController eventLocationController = TextEditingController();

    //Event Data To Firebase

    Future<void> saveEventDataToFirebase({
      required String eventName,
      required String eventId,
      required String eventLocation,
      required String eventLogo,
    }) async {
      ref.read(eventSetupControllerProvider).saveEventDetailsToFirebase(
            eventName: eventName,
            eventId: eventId,
            eventLogo: eventLogo,
            eventLocation: eventLocation,
            context: context,
          );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Column(
              children: [
                //Event Name

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    obscureText: false,
                    controller: eventNameController,
                    style: CustomTextClass.bodyText(context, textColor),
                    decoration: const InputDecoration(
                      hintText: 'Event Name',
                      prefixIcon: Icon(Icons.mail_outline),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                //Event Id

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: eventIdController,
                    obscureText: false,
                    style: CustomTextClass.bodyText(context, textColor),
                    decoration: const InputDecoration(
                      hintText: 'Event Id',
                      prefixIcon: Icon(Icons.bubble_chart),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                //Event Location

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: eventLocationController,
                    obscureText: false,
                    style: CustomTextClass.bodyText(context, textColor),
                    decoration: const InputDecoration(
                      hintText: 'Event Location',
                      prefixIcon: Icon(Icons.location_on),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                //Submit Button

                CustomButton(
                  buttonText: 'Submit',
                  buttonColor: primaryColor,
                  onTap: () {
                    saveEventDataToFirebase(
                      eventId: eventIdController.text.trim(),
                      eventName: eventNameController.text.trim(),
                      eventLocation: eventLocationController.text.trim(),
                      eventLogo:
                          'https://images.unsplash.com/photo-1661961111184-11317b40adb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80',
                    ).whenComplete(
                      () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QRGenerated(
                          qrData: eventIdController.text.trim(),
                        );
                      })),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
