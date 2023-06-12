import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class TextFieldName extends StatelessWidget {
  const TextFieldName({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
            controller: this.textController,
            enabled: false,
            readOnly: true,
            decoration: InputDecorations.authInputDecoration(
              hintText: "Nombre Completo",
              labelText: 'Nombre Completo',
            )));
  }
}
