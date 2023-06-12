// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String user;
  final Data data;

  LoginResponse({
    required this.user,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: json["user"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "data": data.toJson(),
      };
}

class Data {
  final int status;
  final String message;
  final String token;
  final User user;

  Data({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String matricula;
  //final String contrasea;
  final String nombre;
  final String correo;
  final String campus;
  final int semestre;
  final String telefono;
  final String? fotoPerfil;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        matricula: json["matricula"] ?? "",
        //contrasea: json["contraseña"],
        nombre: json["nombre"],
        correo: json["correo"] ?? "",
        campus: json["campus"] ?? "",
        semestre: json["semestre"] ?? 0,
        telefono: json["telefono"] ?? "",
        fotoPerfil: json["foto_perfil"] ?? "",
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
