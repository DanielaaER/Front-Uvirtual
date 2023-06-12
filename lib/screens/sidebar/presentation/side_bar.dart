import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uvirtual/helpers/AuthService.dart';
import 'package:uvirtual/helpers/login_response.dart';
import 'package:uvirtual/screens/login/presentation/login_screen.dart';
import 'package:uvirtual/screens/profile/presentation/changePasswd.dart';
import 'package:http/http.dart' as http;
import 'package:uvirtual/screens/profile/presentation/profile_screen.dart';
import 'dart:async';

import 'dart:io';
import '../../../helpers/estudiante.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String? modifiedUserFoto = AuthService.userFoto?.replaceFirst('uploads/', '');
  User? user;
  Estudiante? estudiante;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getEstudiante();
    String? modifiedUserFoto =
        AuthService.userFoto?.replaceFirst('uploads/', '');
    getEstudiantes();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: Drawer(
        elevation: 0.5,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user?.nombre ?? 'No data'),
              accountEmail: Text(user?.correo ?? 'No data'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'http://40.124.104.203:3003/archivo/$modifiedUserFoto',
                    fit: BoxFit.cover,
                    width: 500,
                    height: 500,
                    errorBuilder: (context, error, stackTrace) {
                      // Si ocurre un error al cargar la imagen remota, mostrar imagen local
                      return Image.asset(
                        'assets/images/profile-icon.jpg',
                        fit: BoxFit.cover,
                        width: 500,
                        height: 500,
                      );
                    },
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/backgroundProfile.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => onItemPressed(context, index: 0),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () => onItemPressed(context, index: 1),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar sesion'),
              onTap: () => onItemPressed(context, index: 2),
            ),
          ],
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const profileScreen()));
        break;
      case 1:
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const loginPage()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Future<void> getEstudiantes() async {
    final userId = AuthService.userId;

    if (AuthService.userType == "Student") {
      final response = await Dio()
          .get("http://40.124.104.203:3003/estudiante/estudiante/$userId");
      user = User.fromJson(response.data);
    } else if (AuthService.userType == "Docente") {
      final response =
          await Dio().get("http://40.124.104.203:3003/docente/docente/$userId");
      user = User.fromJson(response.data);
    }

    setState(() {});
  }
}
