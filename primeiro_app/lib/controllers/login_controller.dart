import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  bool rememberMe = false;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
