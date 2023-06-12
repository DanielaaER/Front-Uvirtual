import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key, required this.textController});
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
                hintText: "zs00000000@estudiantes.uv.mx", labelText: "Email")));
  }
}
