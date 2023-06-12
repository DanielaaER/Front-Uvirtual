import 'package:flutter/material.dart';
import 'package:uvirtual/utils/input_decorations.dart';

class telefonoNuevo extends StatelessWidget {
  final TextEditingController textController;
  const telefonoNuevo({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextFormField(
            controller: this.textController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: "Numero Telefonico",
                labelText: "Numero Telefonico")));
  }
}
