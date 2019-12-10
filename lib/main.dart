import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pantallas/posts.dart';
import './providers/posts.dart' as PostsProvider;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PostsProvider.Posts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Utilizando Provider!',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Posts(),
      ),
    );
  }
}
