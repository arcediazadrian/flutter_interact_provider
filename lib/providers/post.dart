import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  final String id;
  final String usuario;
  final String titulo;
  final String imagen;
  final bool subidaPorUsuario;
  bool meGusta;

  Post({@required this.id, @required this.usuario, @required this.titulo, @required this.imagen, this.meGusta = false, this.subidaPorUsuario = false});

  void toggleMeGusta() {
    meGusta = !meGusta;
    notifyListeners();
  }
}
