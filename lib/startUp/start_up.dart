import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/routes/app_routes.dart';

import '../GetxController/get_registration.dart';



class startUp extends StatefulWidget {
  const startUp({super.key});

  @override
  State<startUp> createState() => _startUpState();
}

class _startUpState extends State<startUp> {
  RegistrationController controller = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 250,),
            Image.asset('assets/logo.png',),
            const SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  controller.isLogin();
                  Get.offNamed(App_Routes.signIn ,);
                },
                child: const Text(
                  'Getting Started',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ),

            // Image.asset('assets/logo.png',height: 150),

          ],
        ),
      ),
    );
  }
}
