import 'package:flutter/material.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class TextFieldVerify extends StatelessWidget {
  const TextFieldVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Contraseña", labelText: "Confirmar contraseña")));
  }
}
