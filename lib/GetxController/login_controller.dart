import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class loginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void loginFromApi() async {
    try{
      final response =
      await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': emailController.value.text,
        'password': emailController.value.text,
      });
      var data = jsonDecode(response.body);
      print (response.statusCode);
      print(data);
      if(response.statusCode==200){
          Get.snackbar("login Succesfull", 'congratulations');
      }else{
          Get.snackbar("login failed", data['error']);
      }
    }catch(e){
      Get.snackbar("Exception", e.toString());
    }

    }


}
