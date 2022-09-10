import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack_odisha_two/common/widgets/custom_button.dart';
import 'package:hack_odisha_two/constants/custom_colors.dart';
import 'package:hack_odisha_two/constants/custom_text.dart';
import 'package:hack_odisha_two/features/authentication/controllers/auth_controller.dart';
import 'package:hack_odisha_two/features/authentication/screens/signup_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //Text Editing Controller

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    //Variables

    bool isObscure = true;

    //Login With Google

    Future<void> loginWithGoogle() async {
      ref.read(authControllerProvider).signInWithGoogle(context);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Logo

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),

                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: primaryColor,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Text(
                    'FlockNest',
                    style: CustomTextClass.h1(context, textColor),
                  ),

                  //Email TextField

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      obscureText: false,
                      style: CustomTextClass.bodyText(context, textColor),
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ),

                  //Password TextField

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      style: CustomTextClass.bodyText(context, textColor),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: CustomTextClass.bodyText(context, textColor),
                        prefixIcon: const Icon(Icons.lock_outline),
                        // suffixIcon: IconButton(
                        //   onPressed: () {
                        //     // setState(() {
                        //     //   isObscure = !isObscure;
                        //     // });
                        //   },
                        //   icon: const Icon(Icons.remove_red_eye),
                        // ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  //Login Button

                  CustomButton(
                    buttonText: 'Login',
                    buttonColor: primaryColor,
                    onTap: () {},
                  ),

                  //Login With Social

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  Text(
                    'Or',
                    style: CustomTextClass.bodyText(context, textColor),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Google

                        IconButton(
                          onPressed: () {
                            loginWithGoogle();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),

                        //Facebook

                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),

                        //Apple

                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.apple,
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Signup Instead

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Don\'t Have An Account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create One.',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
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
