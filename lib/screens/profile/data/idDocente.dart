import 'package:flutter/material.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class IdDocente extends StatelessWidget {
  final TextEditingController textController;
  const IdDocente({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
          readOnly: true,
          controller: this.textController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecorations.authInputDecoration(
              hintText: "ID Docente", labelText: "ID Docente"),
        ));
  }
}
