import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/Utils/utils.dart';
import 'package:getxstate_practice/routes/app_routes.dart';
import '../GetxController/get_registration.dart';
import '../Utils/custom_button.dart';
import '../Utils/custom_icon_button.dart';
import '../Utils/custom_text.dart';
import '../Utils/divider.dart';
import '../Utils/reg_text_form_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final RegistrationController controller = Get.put(RegistrationController());
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    Utils().toastMessage('initialized');
  } // @override
  // void dispose() {
  //   super.dispose();
  //   controller.emailController.dispose();
  //   controller.passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 170),
                  child: CustomText(
                    'Hello',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CustomTextFormFields(
                  LabelText: 'UserName',
                  icon: Icons.person,
                ),
                CustomTextFormFields(
                  LabelText: 'Enter your Email',
                  icon: Icons.person,
                  controller: controller.emailController,
                ),
                CustomTextFormFields(
                  LabelText: 'Password',
                  icon: Icons.lock,
                  controller: controller.passwordController,
                  isPassword: true,
                ),
                CustomTextFormFields(
                  LabelText: 'Confirm Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: controller.confirmPasswordController,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const CustomText(
                      'I agree to all the',
                      fontSize: 16,
                    ),
                    const CustomText(
                      'Terms & Condition',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ],
                ),
                CustomButton(
                  onTap: () {
                    if (controller.passwordController ==
                        controller.confirmPasswordController) {
                      controller.signUp();
                    } else {
                      Utils().toastMessage("password Should be same");
                    }
                  },
                  text: 'Sign Up',
                ),
                const SizedBox(height: 10),
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
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(App_Routes.signIn);
                      },
                      child: const CustomText(
                        'Sign In',
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ), //   <--- image,
    );
  }
}
