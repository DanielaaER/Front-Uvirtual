import 'package:flutter/material.dart';

class SideMenuButton extends StatelessWidget {
  const SideMenuButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                IconButton(onPressed: (){
                }, icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ))
              ],
            ),
          );
  }
}