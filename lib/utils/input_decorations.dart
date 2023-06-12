import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
  }) {
    return InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.lightBlue.withOpacity(0.1),
        filled: true);
  }
}
