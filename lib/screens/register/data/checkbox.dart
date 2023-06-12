import 'package:flutter/material.dart';

class CheckBoxTerms extends StatefulWidget {
  const CheckBoxTerms({Key? key}) : super(key: key);

  @override
  _CheckBoxTermsState createState() => _CheckBoxTermsState();
}

class _CheckBoxTermsState extends State<CheckBoxTerms> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text(
        'Acepto los términos y condiciones',
        style: TextStyle(color: Colors.blue, fontSize: 15),
      ),
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
      },
    );
  }
}
