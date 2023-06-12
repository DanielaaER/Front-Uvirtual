import 'package:flutter/material.dart';

class GuardarCambios extends StatelessWidget {
  final Function onPressed;
  final bool enabled;
  final bool loading;

  const GuardarCambios(
      {super.key,
      required this.onPressed,
      required this.enabled,
      required this.loading});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: loading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text(
              "Guardar Cambios",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
        onPrimary: Colors.grey.withOpacity(0.5),
        primary: Colors.blue,
      ),
      onPressed: enabled ? () => this.onPressed() : null,
    );
  }
}
