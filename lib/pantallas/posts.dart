import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart' as PostProvider;

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<PostProvider.Posts>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: ListView(
        children: postsData.posts
            .map(
              (post) => Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(15), child: Text('Title'),),
                    Container(width: double.infinity, height: 200, padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), child: Image.asset('assets/images/cat.jpg', width: double.infinity, fit: BoxFit.cover,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
