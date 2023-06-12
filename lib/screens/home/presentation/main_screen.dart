import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uvirtual/helpers/horario.dart';
import 'dart:math';
import '../../../helpers/AuthService.dart';
import '../../../helpers/estudiante.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color textColorLight = Colors.white;
  Color textColorDark = Colors.black;
  List<Horario> horario = [];

  @override
  void initState() {
    super.initState();
    getHorario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'UVirtual',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Horario',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: horario.length,
                itemBuilder: (context, index) {
                  Horario horarioItem = horario[index];

                  // Generar un color aleatorio para la línea vertical
                  Color randomColor =
                      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                          .withOpacity(1.0);

                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 5.0,
                            color: randomColor, // Utilizar el color aleatorio
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                horarioItem.nombre ?? '',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? textColorLight
                                      : textColorDark,
                                ),
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (horarioItem.lunes != null)
                                    Text('Lunes: ${horarioItem.lunes}'),
                                  if (horarioItem.martes != null)
                                    Text('Martes: ${horarioItem.martes}'),
                                  if (horarioItem.miercoles != null)
                                    Text('Miércoles: ${horarioItem.miercoles}'),
                                  if (horarioItem.jueves != null)
                                    Text('Jueves: ${horarioItem.jueves}'),
                                  if (horarioItem.viernes != null)
                                    Text('Viernes: ${horarioItem.viernes}'),
                                  if (horarioItem.sabado != null)
                                    Text('Sábado: ${horarioItem.sabado}'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getHorario() async {
    final userType = AuthService.userType;
    final userId = AuthService.userId;
    String endpoint;
    if (userType == "Docente") {
      endpoint =
          "http://40.124.104.203:3003/horarioDocente/horarioDocente/$userId";
    } else {
      endpoint =
          "http://40.124.104.203:3003/horarioEstudiante/horarioEstudiante/$userId";
    }

    final response = await Dio().get(endpoint);
    List<dynamic> horarioData = response.data;
    List<Horario> horarioList = horarioData
        .map((data) => Horario.fromJson(data))
        .toList(); // Convertir los datos en una lista de objetos Horario
    setState(() {
      horario = horarioList;
    });
  }
}
