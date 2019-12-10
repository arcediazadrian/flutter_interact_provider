import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/posts.dart';

class PantallaCrearPost extends StatefulWidget {
  @override
  _PantallaCrearPostState createState() => _PantallaCrearPostState();
}

class _PantallaCrearPostState extends State<PantallaCrearPost> {
  final _tituloController = TextEditingController();
  File _imagen;

  Future<void> subirImagen() async {
    final imagen =
        await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (imagen == null) {
      return;
    }

    setState(() {
      _imagen = imagen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Post'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Titulo'),
              controller: _tituloController,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: _imagen == null
                        ? Center(
                            child: Text(
                              'Sube una imagen para verla aqui',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                          )
                        : Image.file(
                            _imagen,
                            fit: BoxFit.cover,
                          )),
                FlatButton(
                  child: Text(
                    'Subir imagen',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: subirImagen,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text(
                'Subir Post',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<Posts>(context)
                    .anadirPost(_tituloController.text, _imagen);
                Navigator.of(context).pop();
              },
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
