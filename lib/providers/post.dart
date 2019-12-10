import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  final String id;
  final String titulo;
  final String imagen;
  bool liked;

  Post({this.id, this.titulo, this.imagen});

  void toggleLike() {
    liked = !liked;
  }
}
