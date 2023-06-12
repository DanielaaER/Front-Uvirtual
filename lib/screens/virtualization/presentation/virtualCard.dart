import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uvirtual/helpers/login_response.dart';
import '../../../helpers/AuthService.dart';
import '../../../helpers/estudiante.dart'; // it will allows us to get the pi constant

class VirtualCard extends StatefulWidget {
  @override
  _VirtualCardState createState() => _VirtualCardState();
}

class _VirtualCardState extends State<VirtualCard> {
  String? modifiedUserFoto = AuthService.userFoto?.replaceFirst('uploads/', '');
  User? user;
  Estudiante? estudiante;
  //declare the isBack bool
  bool isBack = true;
  double angle = 0;

  String qrData = '';
  GlobalKey qrKey = GlobalKey();

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getEstudiante();
    getEstudiantes();
    generateQR();
  }

  void generateQR() {
    if (AuthService.userType == "Student") {
      qrData = AuthService.userMatricula!;
    } else {
      qrData = AuthService.userId.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292a3e),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _flip,
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: angle),
                    duration: const Duration(milliseconds: 500),
                    builder: (BuildContext context, double val, __) {
                      if (val >= (pi / 2)) {
                        isBack = false;
                      } else {
                        isBack = true;
                      }
                      return (Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(val),
                        child: Container(
                            width: 550,
                            height: 550,
                            child: isBack
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/cardImage.png"),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 100),
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 50,
                                          child: ClipOval(
                                            child: Image.network(
                                              'http://40.124.104.203:3003/archivo/$modifiedUserFoto',
                                              fit: BoxFit.cover,
                                              width: 500,
                                              height: 500,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
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
                                        const SizedBox(height: 20),
                                        const Text('Nombre'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user?.nombre ?? 'No data',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(height: 15),
                                        const Text('Matricula'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user?.matricula ?? 'No data',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(height: 15),
                                        const Text('Semestre'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user?.semestre.toString() ??
                                              'No data',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(height: 15),
                                        const Text('Campus'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user?.campus ?? 'No data',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const SizedBox(height: 15),
                                        const Text('Telefono'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user?.telefono ?? 'No data',
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(pi),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/cardImage.png"),
                                        ),
                                      ),
                                      child: Center(
                                          child: QrImageView(
                                        key: qrKey,
                                        data: qrData,
                                        size: 200,
                                      )),
                                    ),
                                  )),
                      ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
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
