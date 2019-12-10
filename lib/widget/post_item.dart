import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post.dart' as PostProvider;
import '../providers/posts.dart' as PostsProvider;

enum PostOptions {
  Edit,
  Remove,
}

class PostItem extends StatelessWidget {
  PostItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<PostProvider.Post>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: post.subidaPorUsuario
                          ? NetworkImage(
                              post.usuario,
                            )
                          : AssetImage(
                              post.usuario,
                            ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      post.titulo,
                      //textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  PopupMenuButton(
                    onSelected: (selectedValue) {
                      if (selectedValue == PostOptions.Remove) {
                        Provider.of<PostsProvider.Posts>(context, listen: false)
                            .removePost(post.id);
                      }
                    },
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Edit'),
                        value: PostOptions.Edit,
                      ),
                      PopupMenuItem(
                        child: Text('Remove'),
                        value: PostOptions.Remove,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: post.subidaPorUsuario
                  ? Image.file(
                      File(post.imagen),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      post.imagen,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Consumer<PostProvider.Post>(
                  builder: (ctx, post, child) => IconButton(
                    icon: Icon(
                        post.meGusta ? Icons.favorite : Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () => post.toggleMeGusta(),
                    //label: child,
                  ),
                  //child: Text('Like'),
                ),
                IconButton(
                  icon: Icon(
                    Icons.comment,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
