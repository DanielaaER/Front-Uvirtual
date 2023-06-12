import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class TextFieldPassword extends StatelessWidget {
  final TextEditingController textController;
  const TextFieldPassword({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
            controller: this.textController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Contraseña", labelText: "Contraseña")));
  }
}
