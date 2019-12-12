import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pantallas/pantalla_login.dart';
import './pantallas/pantalla_posts.dart';
import './providers/posts.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
          //child: MaterialApp(),
        ),
        ChangeNotifierProxyProvider<Auth, Posts>(
          create: (ctx) => Posts(),
          update: (ctx, authProvider, anteriorPosts) {
            if (authProvider.estaAutenticado) {
              anteriorPosts.setUsuario = authProvider.usuarioActual.avatar;
            }
            return anteriorPosts;
          },
        ),
      ],
      // child: MaterialApp(),
      child: Consumer<Auth>(
        builder: (ctx, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Utilizando Provider!',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: auth.estaAutenticado ? PantallaPosts() : PantallaLogin(),
        ),
      ),
    );
  }
}
