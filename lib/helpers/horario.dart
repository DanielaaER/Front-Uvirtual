// To parse this JSON data, do
//
//     final horario = horarioFromJson(jsonString);

import 'dart:convert';

List<Horario> horarioFromJson(String str) =>
    List<Horario>.from(json.decode(str).map((x) => Horario.fromJson(x)));

String horarioToJson(List<Horario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Horario {
  int id;
  String nrc;
  String nombre;
  String academico;
  String facultad;
  String campus;
  String edificio;
  String aula;
  String? lunes;
  String? martes;
  String? miercoles;
  String? jueves;
  String? viernes;
  dynamic sabado;

  Horario({
    required this.id,
    required this.nrc,
    required this.nombre,
    required this.academico,
    required this.facultad,
    required this.campus,
    required this.edificio,
    required this.aula,
    this.lunes,
    this.martes,
    this.miercoles,
    this.jueves,
    this.viernes,
    this.sabado,
  });

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        id: json["id"],
        nrc: json["nrc"],
        nombre: json["nombre"],
        academico: json["academico"],
        facultad: json["facultad"],
        campus: json["campus"],
        edificio: json["edificio"],
        aula: json["aula"],
        lunes: json["lunes"],
        martes: json["martes"],
        miercoles: json["miercoles"],
        jueves: json["jueves"],
        viernes: json["viernes"],
        sabado: json["sabado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nrc": nrc,
        "nombre": nombre,
        "academico": academico,
        "facultad": facultad,
        "campus": campus,
        "edificio": edificio,
        "aula": aula,
        "lunes": lunes,
        "martes": martes,
        "miercoles": miercoles,
        "jueves": jueves,
        "viernes": viernes,
        "sabado": sabado,
      };
}
