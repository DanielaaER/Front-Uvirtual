import 'package:flutter/material.dart';
import 'package:uvirtual/screens/login/presentation/login_screen.dart';

class LeaveCardButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const LeaveCardButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: AspectRatio(
        aspectRatio: 208 / 71,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: const Color(0x4960F9).withOpacity(.3),
                spreadRadius: 4,
                blurRadius: 50)
          ]),
          child: MaterialButton(
            onPressed: onPressed,
            splashColor: Colors.lightBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2FbuttonBackgroundSmall.png?alt=media&token=fa2f9bba-120a-4a94-8bc2-f3adc2b58a73"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Container(
                    constraints:
                        const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                    alignment: Alignment.center,
                    child: Text(text,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800)))),
          ),
        ),
      ),
    );
  }
}
