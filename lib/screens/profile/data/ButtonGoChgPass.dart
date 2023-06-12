// ignore: file_names
import 'package:flutter/material.dart';
import 'package:uvirtual/screens/login/presentation/login_screen.dart';
import 'package:uvirtual/screens/profile/presentation/changePasswd.dart';

// ignore: camel_case_types
class goChangePasswd extends StatelessWidget {
  const goChangePasswd({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const changePasswd()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.lightBlue,
        side: const BorderSide(color: Colors.lightBlue, width: 3),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 120),
      ),
      child: const Text(
        "Cambiar datos",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
