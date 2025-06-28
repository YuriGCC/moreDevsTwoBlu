import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Tela de Registro'),
      ),
      body: const Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: const registerForm(),
        ),
      ),
    );
  }
}