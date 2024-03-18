import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/GetxController/get_registration.dart';
import '../Utils/custom_button.dart';
import '../Utils/custom_icon_button.dart';
import '../Utils/custom_text.dart';
import '../Utils/divider.dart';
import '../Utils/reg_text_form_field.dart';
import '../routes/app_routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final RegistrationController controller = Get.put(RegistrationController());
  FirebaseAuth auth = FirebaseAuth.instance;

  // @override
  // void dispose() {
  //   super.dispose();
  //   controller.emailController.dispose();
  //   controller.passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 320,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 150,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'X',
                                style: TextStyle(color: Colors.blue),
                              ),
                              TextSpan(
                                text: '-',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Notes',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 570,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),
                    color: Colors.white),
                child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 100),
                        child: CustomText(
                          'Welcome Back',
                          fontSize: 30,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextFormFields(
                        LabelText: 'Enter your email',
                        icon: Icons.person,
                        controller: controller.emailController,
                      ),
                      CustomTextFormFields(
                        LabelText: 'Password',
                        icon: Icons.person,
                        controller: controller.passwordController,
                        isPassword: true,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 230, top: 10),
                        child: CustomText(
                          'Forget Password',
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          controller.login();
                          //Get.offNamed(App_Routes.dashboard);
                        },
                        text: 'SignIn',
                      ),

                      const SizedBox(
                          height: 10), // Add some space between button and line
                      const DividerLine(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            imageUrl:
                                'https://e7.pngegg.com/pngimages/715/371/png-clipart-youtube-google-logo-google-s-google-account-youtube-text-trademark.png',
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          CustomIconButton(
                              imageUrl:
                                  'https://w7.pngwing.com/pngs/664/673/png-transparent-apple-logo-iphone-computer-apple-logo-company-heart-logo-thumbnail.png',
                              onPressed: () {}),
                          const SizedBox(width: 10),
                          CustomIconButton(
                              imageUrl:
                                  'https://img.freepik.com/free-psd/3d-square-with-facebook-logo_125540-1565.jpg',
                              onPressed: () {}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomText(
                            'Dont you have an account?',
                            fontSize: 16,
                          ),

                          const SizedBox(
                              width:
                                  10), // Add some space between text and button
                          TextButton(
                            onPressed: () {
                              Get.toNamed(App_Routes.signUp);
                            },
                            child: const CustomText(
                              'Sign Up',
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
