import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class TextFieldUser extends StatelessWidget {
  const TextFieldUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[ZSzs0-9]', caseSensitive: false)),
            ],
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: "ZS00000000", labelText: "Matricula")));
  }
}
