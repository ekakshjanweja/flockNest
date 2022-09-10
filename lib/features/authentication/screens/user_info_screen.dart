import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hack_odisha_two/common/widgets/custom_button.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/features/authentication/controllers/auth_controller.dart';
import 'package:hack_odisha_two/features/event_setup/screens/host_screen.dart';

import '../../../constants/custom_text.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  static const routeName = '/user-info-screen';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    //Save User Data To Firebase

    Future<void> saveUserDataToFirebase(String name) async {
      ref
          .read(authControllerProvider)
          .saveUserDataToFirebase(context: context, name: name);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                //Current User Info

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                Text(
                  'Currently Logged In As ${FirebaseAuth.instance.currentUser!.displayName.toString()}',
                  style: CustomTextClass.h3(context, primaryColor),
                  textAlign: TextAlign.center,
                ),

                Text(
                  FirebaseAuth.instance.currentUser!.email.toString(),
                  style: CustomTextClass.bodyText(context, textColor),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                //Name

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    enabled: false,
                    obscureText: false,
                    style: CustomTextClass.bodyText(context, textColor),
                    decoration: InputDecoration(
                      hintText:
                          '${FirebaseAuth.instance.currentUser!.displayName}',
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                //Email

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    enabled: false,
                    obscureText: false,
                    style: CustomTextClass.bodyText(context, textColor),
                    decoration: InputDecoration(
                      hintText: '${FirebaseAuth.instance.currentUser!.email}',
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                ),

                //Submit Your Details

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextButton(
                    onPressed: () {
                      saveUserDataToFirebase(FirebaseAuth
                          .instance.currentUser!.displayName
                          .toString());
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor.withOpacity(0.5),
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    child: Text(
                      'Submit Details',
                      style: CustomTextClass.h2(context, textColor),
                    ),
                  ),
                ),

                //Host Or Atendee

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Host Button

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.003,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HostScreen.routeName);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor.withOpacity(0.5),
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                        child: Text(
                          'Host',
                          style: CustomTextClass.h2(context, textColor),
                        ),
                      ),
                    ),

                    //Atendee Button

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HostScreen.routeName);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor.withOpacity(0.5),
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                        child: Text(
                          'Atendee',
                          style: CustomTextClass.h2(context, textColor),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.003,
                    ),
                  ],
                ),

                //Event Id

                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.05,
                // ),

                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.7,
                //   child: TextField(
                //     obscureText: false,
                //     style: CustomTextClass.bodyText(context, textColor),
                //     decoration: InputDecoration(
                //       hintText: 'Event Id',
                //       prefixIcon: const Icon(Icons.email_outlined),
                //     ),
                //   ),
                // ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.05,
                // ),

                //LogOut

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                CustomButton(
                  buttonText: 'Logout',
                  buttonColor: primaryColor,
                  onTap: () {
                    ref.read(authControllerProvider).singOut(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
