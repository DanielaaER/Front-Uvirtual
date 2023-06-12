import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uvirtual/helpers/estudiante.dart';
import 'package:uvirtual/helpers/login_response.dart';

class AuthService with ChangeNotifier {
  static int? userId;
  static String? userFoto;
  String? _modifiedUserFoto;
  String? get modifiedUserFoto => _modifiedUserFoto;
  static String? userMatricula;
  static String? userType;
  static String? userNombre;
  static String? userCorreo;

  final _storage = new FlutterSecureStorage();

  bool _auntenticando = false;

  bool get autenticando => _auntenticando;
  set autenticando(bool valor) {
    _auntenticando = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<String?> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  User? user;

  Future<bool> login(String matricula, String password) async {
    if (matricula.isEmpty || password.isEmpty) {
      return false; // Retorna false si alguno de los campos está vacío
    }

    try {
      final data = {'matricula': matricula, 'contraseña': password};

      final response = await Dio().post(
        'http://40.124.104.203:3003/login',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
        data: jsonEncode(data),
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final loginResponse = loginResponseFromJson(json.encode(response.data));
        user = loginResponse.data.user;
        userType = loginResponse.user;
        userId = user?.id; // Asignar el ID del usuario a la variable global
        userMatricula = user?.matricula;
        userNombre = user?.nombre;
        userCorreo = user?.correo;
        userFoto = user?.fotoPerfil;
        _modifiedUserFoto = userFoto?.replaceFirst('uploads/', '') ?? '';

        print('User FotoPath: $modifiedUserFoto');
        print('User ID: $userId');
        await _guardarToken(loginResponse.data.token);
        print('Tipo Usuario: $userType');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error during login request: $e');
      return false;
    }
  }

  Future<bool?> changePassword(String idDocente, String passwdActual,
      String passwdNueva, String telefono, String correo) async {
    final userId = AuthService.userId;
    print(userId);
    try {
      final data = {
        'id': idDocente,
        'contraseña': passwdActual,
        'new_password': passwdNueva,
        'telefono': telefono,
        'correo': correo,
      };

      final response = await Dio().put(
        'http://40.124.104.203:3003/docente/$userId',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
        data: data,
      );

      return response.statusCode! >= 200 && response.statusCode! < 300;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    print(token);
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
