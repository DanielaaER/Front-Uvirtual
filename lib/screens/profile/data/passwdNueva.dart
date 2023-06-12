import 'package:flutter/material.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class passwdNueva extends StatelessWidget {
  const passwdNueva({super.key, required this.textController});
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
                hintText: "Contraseña Nueva", labelText: "Contraseña Nueva")));
  }
}
