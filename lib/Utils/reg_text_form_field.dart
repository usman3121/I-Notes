
import 'package:flutter/material.dart';



class CustomTextFormFields extends StatelessWidget {
  const CustomTextFormFields({
     required this.LabelText,required this.icon,   this.controller,   this.isPassword=false,
  });
  final String LabelText;
  final IconData icon;
  final TextEditingController? controller;
  final bool  isPassword;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration:  InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          labelText: LabelText,
          prefixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $LabelText';
          }
          return null;
        },
      ),
    );
  }
}