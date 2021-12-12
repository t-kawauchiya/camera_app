import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'FileController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker Sample'),
        ),
        body: Container(
            child: Column(
          children: [
            _image == null
                ? Text('No image selected.')
                : Image.memory(_image!.readAsBytesSync()),
            Row(children: [
              FloatingActionButton(
                  onPressed: () {
                    _getImageFromDevice(ImageSource.camera);
                  },
                  child: Icon(Icons.add_a_photo)),
              FloatingActionButton(
                onPressed: () {
                  _getImageFromDevice(ImageSource.gallery);
                },
                child: Icon(Icons.add_photo_alternate),
              )
            ])
          ],
        )));
  }

  final picker = ImagePicker();
  final fileController = FileController();

  Future _getImageFromDevice(ImageSource source) async {
    var _imageFile = await picker.pickImage(source: source);
    if (_imageFile == null) {
      return;
    }
    var savedFile = await fileController.saveLocalImage(File(_imageFile.path));
    setState(() {
      _image = savedFile;
    });
  }
}
