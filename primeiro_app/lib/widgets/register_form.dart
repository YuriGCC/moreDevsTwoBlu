import 'package:flutter/material.dart';
import 'package:primeiro_app/screens/login_screen.dart';
import '../controllers/register_controller.dart';

class registerForm extends StatefulWidget {
    const registerForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _registerFormState();
  }
}

class _registerFormState extends State<registerForm> {
  final controller = registerController();
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  String password = '';

  bool hasUppercase(String value) => RegExp(r'[A-Z]').hasMatch(value);
  bool hasLowercase(String value) => RegExp(r'[a-z]').hasMatch(value);
  bool hasDigit(String value) => RegExp(r'\d').hasMatch(value);
  bool hasSpecialChar(String value) => RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:"\\|,.<>\/?]').hasMatch(value);
  bool hasMinLength(String value) => value.length >= 8;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form( key: controller.formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(child: Text('Cadastre-se', style: TextStyle(color: Colors.white),)),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.userNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Nome",
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }

              if (value.length < 3 ) {
                return 'O nome de usuário é muito pequeno';
              }

              return null;
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "e-mail",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder()
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }

              final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
              if (!emailRegex.hasMatch(value)) {
                return 'E-mail inválido';
              }

              return null;
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white, fontSize: 16)
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.ageController,
            keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  labelText: "Idade",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder()
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }

              final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
              if (!regex.hasMatch(value)) {
                return 'Formato inválido (use dd/MM/yyyy)';
              }
              
              return null;
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white, fontSize: 16)
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.passwordController,
            obscureText: _obscureRepeatPassword,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                labelText: "Senha",
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureRepeatPassword = !_obscureRepeatPassword;
                      });
                    },
                    icon: Icon(
                      _obscureRepeatPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    )),
                border: OutlineInputBorder()
            ),
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white, fontSize: 16)
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRuleText("Mínimo 8 caracteres", hasMinLength(password)),
              buildRuleText("1 letra maiúscula", hasUppercase(password)),
              buildRuleText("1 letra minúscula", hasLowercase(password)),
              buildRuleText("1 número", hasDigit(password)),
              buildRuleText("1 caractere especial", hasSpecialChar(password)),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
              controller: controller.repeatPasswordController,
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: "repita a senha",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório';
                }

                if (value != controller.passwordController.text) {
                  return 'As senhas não coincidem';
                }

                return null;
              },
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.white, fontSize: 16)
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
            ),
              onPressed: () {
                if(controller.validateForm()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }
              }
              , child: Text('registrar-se', style: TextStyle(color: Colors.white),))
        ],
      )
    ));
  }

  Widget buildRuleText(String text, bool valid) {
    return Row(
      children: [
        Icon(valid ? Icons.check : Icons.close, size: 16, color: valid ? Colors.green : Colors.red),
        SizedBox(width: 5),
        Text(text, style: TextStyle(color: valid ? Colors.green : Colors.red))
      ],
    );
  }
}