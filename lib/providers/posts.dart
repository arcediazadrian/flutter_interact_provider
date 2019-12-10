import 'dart:io';

import 'package:flutter/foundation.dart';
import './post.dart';

class Posts with ChangeNotifier {
  List<Post> _posts = [
    Post(
      id: 'p1',
      usuario: 'assets/images/avatar1.jpg',
      titulo: 'Amo los gatos!',
      imagen: 'assets/images/cat2.jpeg',
    ),
    Post(
      id: 'p2',
      usuario: 'assets/images/avatar2.png',
      titulo: 'Momazo xD',
      imagen: 'assets/images/meme.jpeg',
    ),
    Post(
      id: 'p3',
      usuario: 'assets/images/avatar4.jpeg',
      titulo: 'Hermosa bolivia <3',
      imagen: 'assets/images/bolivia.jpeg',
    ),
  ];

  String _usuarioActual;

  set setUsuario(String usuario) {
    _usuarioActual = usuario;
  }

  List<Post> get posts {
    return [..._posts];
  }

  void anadirPost(String titulo, File imagen) {
    _posts.add(
      Post(
        id: DateTime.now().toString(),
        titulo: titulo,
        imagen: imagen.path,
        usuario: _usuarioActual,
        subidaPorUsuario: true,
      ),
    );
    notifyListeners();
  }

  void removePost(String id) {
    _posts.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}
