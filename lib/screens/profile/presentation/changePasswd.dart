import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uvirtual/core/error/mostrarAlerta.dart';
import 'package:uvirtual/helpers/AuthService.dart';
import 'package:uvirtual/screens/login/presentation/login_screen.dart';
import 'package:uvirtual/screens/profile/data/TextFieldEmail.dart';
import 'package:uvirtual/screens/profile/data/TextFieldName.dart';
import 'package:uvirtual/screens/profile/data/buttonNewPasswd.dart';
import 'package:uvirtual/screens/profile/data/correoNuevo.dart';
import 'package:uvirtual/screens/profile/data/idDocente.dart';
import 'package:uvirtual/screens/profile/data/passwdActual.dart';
import 'package:uvirtual/screens/profile/data/passwdActualVerify.dart';
import 'package:uvirtual/screens/profile/data/passwdNueva.dart';
import 'package:uvirtual/screens/profile/data/photoProfile.dart';
import 'package:uvirtual/screens/profile/data/telefonoNuevo.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class changePasswd extends StatefulWidget {
  const changePasswd({super.key});

  @override
  State<StatefulWidget> createState() => _changePasswdState();
}

class _changePasswdState extends State<changePasswd> {
  final passACrtl = TextEditingController();
  final passNCrtl = TextEditingController();
  final EmailCrtl = TextEditingController();
  final telCrtl = TextEditingController();
  final verifyCrtl = TextEditingController();
  TextEditingController idDocCrtl =
      TextEditingController(text: AuthService.userId.toString());

  @override
  void dispose() {
    passACrtl.dispose();
    passNCrtl.dispose();
    EmailCrtl.dispose();
    telCrtl.dispose();
    verifyCrtl.dispose();
    idDocCrtl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              photoProfile(),
              const SizedBox(height: 30),
              IdDocente(textController: idDocCrtl),
              const SizedBox(height: 15),
              CorreoNuevo(textController: EmailCrtl),
              const SizedBox(height: 15),
              telefonoNuevo(textController: telCrtl),
              const SizedBox(height: 15),
              passwdActual(textController: passACrtl),
              const SizedBox(height: 15),
              passwdNueva(textController: passNCrtl),
              const SizedBox(height: 15),
              passwdnuevaVerify(textController: verifyCrtl),
              const SizedBox(height: 30),
              GuardarCambios(
                onPressed: () async {
                  final idDocente = idDocCrtl.text.trim();
                  final passwdActual = passACrtl.text.trim();
                  final passwdNueva = passNCrtl.text.trim();
                  final passwdNuevaVerify = verifyCrtl.text.trim();
                  final telefono = telCrtl.text.trim();
                  final correo = EmailCrtl.text.trim();

                  print(passwdNueva);
                  print(passwdNuevaVerify);

                  if (passwdNueva != passwdNuevaVerify) {
                    mostrarAlerta(
                      context,
                      'Contraseñas no coinciden',
                      'Por favor, ingrese las contraseñas nuevamente',
                    );
                    return;
                  }

                  if (idDocente.isEmpty || telefono.isEmpty || correo.isEmpty) {
                    mostrarAlerta(
                      context,
                      'Campos vacíos',
                      'Por favor, complete todos los campos',
                    );
                    return;
                  }

                  if (passwdNueva.isEmpty || passwdNuevaVerify.isEmpty) {
                    mostrarAlerta(
                      context,
                      'Contraseñas vacías',
                      'Por favor, ingrese las contraseñas',
                    );
                    return;
                  }

                  authService.autenticando =
                      true; // Deshabilitar el botón y mostrar el indicador de carga

                  final cambiosGuardados = await authService.changePassword(
                      idDocente, passwdActual, passwdNueva, telefono, correo);

                  authService.autenticando =
                      false; // Volver a habilitar el botón y ocultar el indicador de carga

                  if (cambiosGuardados != null && cambiosGuardados) {
                    mostrarAlerta(context, 'Cambios guardados',
                            'Los cambios se guardaron exitosamente')
                        .then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginPage()),
                      );
                    });
                  } else {
                    mostrarAlerta(context, 'Error',
                        'No se pudieron guardar los cambios. Por favor, inténtelo nuevamente');
                  }
                },
                enabled: !authService.autenticando,
                loading: authService.autenticando,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
