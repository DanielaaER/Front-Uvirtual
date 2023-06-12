import 'package:flutter/material.dart';
import 'package:uvirtual/screens/register/data/TextFormFields/textFielUser.dart';
import 'package:uvirtual/screens/register/data/TextFormFields/textFieldPass.dart';
import 'package:uvirtual/screens/register/data/TextFormFields/textFieldVerify.dart';
import 'package:uvirtual/screens/register/data/buttons/registerButton.dart';
import 'package:uvirtual/screens/register/data/checkbox.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<StatefulWidget> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              Image.asset("assets/images/ic_app.png"),
              const SizedBox(height: 30),
              const TextFieldUser(),
              const SizedBox(height: 15),
              const TextFieldPass(),
              const SizedBox(height: 15),
              const TextFieldVerify(),
              const SizedBox(height: 15),
              const CheckBoxTerms(),
              const SizedBox(height: 20),
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
