import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import './register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Icon(Icons.account_circle, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Faça login para continuar',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              const LoginForm(),
              const SizedBox(height: 40),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                      child: Text('Cadastrar-se', style: TextStyle(fontSize: 18)),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
