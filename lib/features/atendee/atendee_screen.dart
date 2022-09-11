import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_odisha_two/common/widgets/custom_button.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/constants/custom_text.dart';
import 'package:hack_odisha_two/features/event_setup/screens/event_stream.dart';

class AtendeeScreen extends StatelessWidget {
  static const routeName = '/atendee-screen';
  const AtendeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get User Data
    getUserData() async {
      QuerySnapshot<Map<String, dynamic>> eventData =
          await FirebaseFirestore.instance.collection('users').get();

      final allEvents =
          eventData.docs.map((elememnt) => elememnt.data()).toList();

      print(allEvents);
    }

    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  //Atendee Name

                  Text(
                    '${FirebaseAuth.instance.currentUser!.displayName}',
                    style: CustomTextClass.h2(context, textColor),
                  ),

                  //Stream

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: EventStream(),
                  ),

                  CustomButton(
                    buttonText: 'Get Data',
                    buttonColor: primaryColor,
                    onTap: () {
                      getUserData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
