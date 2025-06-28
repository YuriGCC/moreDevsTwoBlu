import 'package:flutter/material.dart';

class registerController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  final ageController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    ageController.dispose();
    repeatPasswordController.dispose();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

}