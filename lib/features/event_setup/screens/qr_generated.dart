import 'package:flutter/material.dart';
import 'package:hack_odisha_two/common/widgets/custom_button.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/constants/custom_text.dart';
import 'package:hack_odisha_two/features/event_setup/screens/host_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerated extends StatelessWidget {
  static const routeName = '/qr-generated-screen';
  final String qrData;
  const QRGenerated({
    Key? key,
    required this.qrData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(40),
                    color: textColor,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: QrImage(
                      data: qrData,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    'Take A ScreenShot And Share',
                    style: CustomTextClass.h1(context, textColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomButton(
                      buttonText: 'Create More Events',
                      buttonColor: primaryColor,
                      onTap: () {
                        Navigator.pushNamed(context, HostScreen.routeName);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
