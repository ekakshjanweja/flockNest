// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack_odisha_two/common/widgets/custom_button.dart';

import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/constants/custom_text.dart';
import 'package:hack_odisha_two/features/authentication/screens/user_info_screen.dart';
import 'package:hack_odisha_two/features/event_setup/screens/qr_generated.dart';

class EventScreen extends StatelessWidget {
  static const routeName = '/event-screen';
  final String eventName;
  final String eventId;
  final String eventLocation;
  final String imageUrl;
  const EventScreen({
    Key? key,
    required this.eventName,
    required this.eventId,
    required this.eventLocation,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageUrl),
                Text(
                  eventName,
                  style: CustomTextClass.h1(
                    context,
                    textColor,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventId,
                        style: CustomTextClass.h2(
                          context,
                          textColor,
                        ),
                      ),
                      Text(
                        eventLocation,
                        style: CustomTextClass.h2(
                          context,
                          textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'Event Description',
                  style: CustomTextClass.h2(
                    context,
                    textColor,
                  ),
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting'
                  'Lorem Ipsum is simply dummy text of the printing and typesetting '
                  'industry. Lorem Ipsum has been the industry\'s standard dummy text'
                  ' ever since the 1500s, when an unknown printer took a galley of type. ',
                  style: CustomTextClass.bodyText(
                    context,
                    textColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                //Buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomButton(
                          buttonText: 'Going',
                          buttonColor: primaryColor,
                          onTap: () {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .set({
                              'name': FirebaseAuth
                                  .instance.currentUser!.displayName,
                              'uid': FirebaseAuth.instance.currentUser!.uid,
                              'eventId': eventId,
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomButton(
                          buttonText: 'Skip',
                          buttonColor: primaryColor,
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              UserInfoScreen.routeName,
                              (route) => false,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
