import 'package:flutter/material.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class passwdnuevaVerify extends StatelessWidget {
  const passwdnuevaVerify({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
            controller: this.textController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Confirmar Contraseña",
                labelText: "Confirmar Contraseña")));
  }
}
