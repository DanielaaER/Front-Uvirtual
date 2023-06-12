import 'package:flutter/material.dart';
import 'package:uvirtual/screens/home/data/buttonGoVitualization.dart';
import 'package:uvirtual/screens/virtualization/presentation/virtualCard.dart';

class CredentialPage extends StatefulWidget {
  const CredentialPage({super.key});

  @override
  State<CredentialPage> createState() => _CredentialPageState();
}

class _CredentialPageState extends State<CredentialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 450,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/showExample.png"))),
        ),
        const SizedBox(height: 40),
        IrVirtualizar(
          text: "Generar Credencial",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VirtualCard()));
          },
        )
      ],
    ))));
  }
}
