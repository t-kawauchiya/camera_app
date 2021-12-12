import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class FileController {
  Future saveLocalImage(File image) async {
    final path = await localPath;
    String fileName = makeFileName();
    final imagePath = '$path/$fileName';
    File imageFile = File(imagePath);
    var savedFile = await imageFile.writeAsBytes(await image.readAsBytes());
    // or
    // var savedFile = await image.copy(imagePath);
    return savedFile;
  }

  Future leadLocalImage() async {
    final path = await localPath;
    final imagePath = '$path/image.png';
    return File(imagePath);
  }

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  String makeFileName() {
    DateTime a = DateTime.now();
    final dt = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    return '$dt.png';
  }
}
