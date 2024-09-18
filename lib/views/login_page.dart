import 'package:cat_facts/components/app_bar_component.dart';
import 'package:cat_facts/components/form_text_field_component.dart';
import 'package:cat_facts/components/main_button_component.dart';
import 'package:cat_facts/components/snack_bar_component.dart';
import 'package:cat_facts/controllers/access_controller.dart';
import 'package:cat_facts/views/cat_fact_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  var _userController = TextEditingController();
  var _passwordController = TextEditingController();

  Future<void> _login(GlobalKey<FormState> formKey) async {
    final NavigatorState _navigator = Navigator.of(context);
    final ScaffoldMessengerState scaffoldMessenger =
        ScaffoldMessenger.of(context);
    if (formKey.currentState!.validate()) {
      bool logged = await AccessController.instance
          .login(_userController.text, _passwordController.text);

      if (logged) {
        _navigator.pushReplacement(
            MaterialPageRoute(builder: (context) => const CatFactPage()));
      } else {
        scaffoldMessenger.showSnackBar(snackBar(
          message: 'Autenticação inválida',
          color: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(leading: true),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Usuário'),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                labelText: 'Usuário',
                hintText: 'usuario.user',
                textController: _userController,
                inputValidator: (username) {
                  if (username == null || username.isEmpty) {
                    return "Preencha o campo de usuário";
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text('Senha'),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                labelText: 'Senha',
                hintText: 'Senha',
                obscureText: true,
                textController: _passwordController,
                inputValidator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Preecha o campo de senha";
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              mainButton(
                  buttonText: 'Entrar',
                  buttonFunction: () async {
                    await _login(_formKey);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
