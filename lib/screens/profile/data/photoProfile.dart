import 'package:flutter/material.dart';

class photoProfile extends StatelessWidget {
  const photoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage("assets/images/profile-icon.jpg"),
        ),
      ],
    );
  }
}
