import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/usuario.dart';

class Auth with ChangeNotifier {
  Usuario _usuarioActual;

  Usuario get usuarioActual {
    return _usuarioActual;
  }

  bool get estaAutenticado {
    return _usuarioActual != null;
  }

  Future<void> autenticar(String email, String password) async {
    final respuesta = await http.get(
        'http://my-json-server.typicode.com/arcediazadrian/flutter_interact_fake_server/users');
    final listaUsuarios = json.decode(respuesta.body) as List<dynamic>;

    Map<String, dynamic> usuarioExistente =
        listaUsuarios.firstWhere((u) => u['email'] == email && u['password'] == password);
    if (usuarioExistente != null) {
      _usuarioActual = Usuario(
        id: usuarioExistente['id'],
        email: usuarioExistente['email'],
        password: usuarioExistente['password'],
        nombre: usuarioExistente['nombre'],
        avatar: usuarioExistente['avatar'],
      );
    }
    notifyListeners();
  }
}
