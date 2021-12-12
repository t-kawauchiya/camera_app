import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'photo',
            ),
            FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Increment',
              child: Icon(Icons.add_a_photo),
            )
          ],
        ),
      ),
    ));
  }

  final picker = ImagePicker();
  File? _image;
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      this._image = File(pickedFile.path);
    }
  }
}
