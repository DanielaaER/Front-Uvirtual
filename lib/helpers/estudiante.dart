import 'dart:convert';

Estudiante estudianteFromJson(String str) =>
    Estudiante.fromJson(json.decode(str));

String estudianteToJson(Estudiante data) => json.encode(data.toJson());

class Estudiante {
  final int id;
  final String matricula;
  //final String contrasea;
  final String nombre;
  final String correo;
  final String campus;
  final int semestre;
  final String telefono;
  final String fotoPerfil;

  Estudiante({
    required this.id,
    required this.matricula,
    //required this.contrasea,
    required this.nombre,
    required this.correo,
    required this.campus,
    required this.semestre,
    required this.telefono,
    required this.fotoPerfil,
  });

  factory Estudiante.fromJson(Map<String, dynamic> json) => Estudiante(
        id: json["id"],
        matricula: json["matricula"],
        //contrasea: json["contraseña"],
        nombre: json["nombre"],
        correo: json["correo"],
        campus: json["campus"],
        semestre: json["semestre"],
        telefono: json["telefono"],
        fotoPerfil: json["foto_perfil"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "matricula": matricula,
        //"contraseña": contrasea,
        "nombre": nombre,
        "correo": correo,
        "campus": campus,
        "semestre": semestre,
        "telefono": telefono,
        "foto_perfil": fotoPerfil,
      };
}
