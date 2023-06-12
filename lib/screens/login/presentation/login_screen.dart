import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uvirtual/core/error/mostrarAlerta.dart';
import 'package:uvirtual/screens/login/data/loginButton.dart';
import 'package:uvirtual/screens/login/data/registerButton.dart';
import 'package:uvirtual/screens/login/data/textFieldContrase%C3%B1a.dart';
import 'package:uvirtual/screens/register/data/TextFormFields/textFielUser.dart';
import 'package:uvirtual/screens/register/data/TextFormFields/textFieldPass.dart';

import '../../../helpers/AuthService.dart';
import '../../home/presentation/home_screen.dart';
import '../data/textFieldMatricula.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<StatefulWidget> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final matriculaCrtl = TextEditingController();
  final passCrtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.asset("assets/images/ic_app.png"),
              const SizedBox(height: 30),
              TextFieldMatricula(
                textController: matriculaCrtl,
              ),
              const SizedBox(height: 15),
              TextFieldPassword(
                textController: passCrtl,
              ),
              const SizedBox(
                height: 50,
              ),
              MyLoginButton(
                onPressed: () async {
                  final matricula = matriculaCrtl.text.trim();
                  final password = passCrtl.text.trim();

                  if (matricula.isEmpty || password.isEmpty) {
                    mostrarAlerta(context, 'Campos vacíos',
                        'Por favor, complete todos los campos');
                    return;
                  }

                  // Deshabilitar el botón y mostrar el indicador de carga mientras se realiza la petición de login
                  authService.autenticando = true;

                  final loginOk = await authService.login(matricula, password);

                  // Volver a habilitar el botón y ocultar el indicador de carga después de la petición de login
                  authService.autenticando = false;

                  if (loginOk) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    mostrarAlerta(
                        context, 'Login erroneo', 'Verifique sus datos');
                  }
                },
                enabled: !authService.autenticando,
                loading: authService
                    .autenticando, // Pasar el estado de carga al botón
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
