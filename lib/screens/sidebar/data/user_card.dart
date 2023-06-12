import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.name, required this.profession});

  final String name, profession;

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person,
          color: Colors.white,
          ),
        ),
        title: Text(
          "User usuario",
          style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        "Ocupación",
        style: TextStyle(color: Colors.white),  
      ),
    );
  }
}