import 'dart:async';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:hive/hive.dart';

class WordFileManager {
  static const String boxName = 'wordFiles';

  /// Open file picker to select a .doc/.docx file
  static Future<html.File?> pickWordFileFromDevice() async {
    final input = html.FileUploadInputElement()..accept = '.doc,.docx';
    input.click();

    final completer = Completer<html.File?>();

    input.onChange.listen((event) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        completer.complete(files.first);
      } else {
        completer.complete(null);
      }
    });

    return completer.future;
  }

  static Future<html.File?> pickImgFileFromDevice() async {
    final input = html.FileUploadInputElement()..accept = '.png,.jpg,.jpeg';
    input.click();

    final completer = Completer<html.File?>();

    input.onChange.listen((event) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        completer.complete(files.first);
      } else {
        completer.complete(null);
      }
    });

    return completer.future;
  }

  /// convert the picked Word file into unit8list
  static Future<Uint8List?> convertFileToUnit8List(html.File file) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);
    await reader.onLoad.first;
    final bytes = reader.result as Uint8List;
    return bytes;
  }

  /// Download the Word file stored in Hive
  static Future<void> downloadFileFromHive(String key) async {
    final box = await Hive.openBox<Uint8List>(boxName);
    final bytes = box.get(key);
    if (bytes != null) {
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "$key.docx")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      print("File not found in Hive");
    }
  }
}
