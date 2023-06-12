import 'package:flutter/material.dart';
import 'package:uvirtual/helpers/AuthService.dart';
import 'package:uvirtual/screens/profile/data/ButtonGoChgPass.dart';
import 'package:uvirtual/screens/profile/data/TextFieldEmail.dart';
import 'package:uvirtual/screens/profile/data/TextFieldName.dart';
import 'package:uvirtual/screens/profile/data/photoProfile.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  TextEditingController correoDocente =
      TextEditingController(text: AuthService.userCorreo);
  TextEditingController NameDocente =
      TextEditingController(text: AuthService.userNombre!);
  @override
  Widget build(BuildContext context) {
    bool isDocente = AuthService.userType == "Docente";
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(30),
          child: Column(children: [
            const SizedBox(height: 50),
            photoProfile(),
            const SizedBox(height: 30),
            TextFieldName(
              textController: NameDocente,
            ),
            const SizedBox(height: 15),
            TextFieldEmail(textController: correoDocente),
            const SizedBox(
              height: 100,
            ),
            if (isDocente) goChangePasswd()
          ]),
        ),
      ),
    );
  }
}
