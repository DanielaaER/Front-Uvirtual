import 'package:flutter/material.dart';

class IrVirtualizar extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const IrVirtualizar({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 0, 174, 255);

    return OutlinedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          side: MaterialStateProperty.all(
              const BorderSide(width: 1, color: primaryColor)),
          padding: MaterialStateProperty.all(const EdgeInsets.only(
              right: 75, left: 75, top: 12.5, bottom: 12.5)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: primaryColor, fontSize: 16),
      ),
    );
  }
}
