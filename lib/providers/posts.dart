import 'package:flutter/foundation.dart';
import './post.dart';


class Posts with ChangeNotifier {
  List<Post> _posts = [
    Post(id: 'p1', titulo: 'Amo los gatos', imagen: 'assets/images/cat.jpg')
  ];

  List<Post> get posts {
    return [..._posts];
  }
}
