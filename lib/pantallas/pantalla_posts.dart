import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pantallas/pantalla_crear_post.dart';
import '../providers/posts.dart';
import '../widget/post_item.dart';

class PantallaPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<Posts>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => PantallaCrearPost())),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: postsData.posts.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: postsData.posts[index],
          child: PostItem(),
        ),
      ),
    );
  }
}
