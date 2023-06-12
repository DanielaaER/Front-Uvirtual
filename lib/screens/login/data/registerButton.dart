// ignore: file_names
import 'package:flutter/material.dart';
import 'package:uvirtual/screens/register/presentation/register_screen.dart';

class GoRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const registerPage()));
      },
      child: const Text(
        "Registrar",
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.lightBlue,
        side: const BorderSide(color: Colors.lightBlue, width: 3),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 120),
      ),
    );
  }
}
