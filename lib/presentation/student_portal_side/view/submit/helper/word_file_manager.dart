import 'dart:async';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:hive/hive.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:universal_html/html.dart' as html;

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

  static String extractTextFromDocx(Uint8List bytes) {
    String combinedText = "";
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      if (file.name == 'word/document.xml') {
        final xmlContent = utf8.decode(file.content);
        combinedText = combinedText + parseTextFromXml(xmlContent);
        break;
      }
    }
    return combinedText;
  }

  static String parseTextFromXml(String xml) {
    final text = xml
        .replaceAll(RegExp(r'<[^>]+>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    return text;
  }

  static void downloadAsZip(Uint8List wordBytes) {
    final archive = Archive()
      ..addFile(ArchiveFile('original.docx', wordBytes.length, wordBytes));

    final zippedBytes = ZipEncoder().encode(archive);
    final blob = html.Blob([Uint8List.fromList(zippedBytes!)]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'converted.zip')
      ..click();
    html.Url.revokeObjectUrl(url);
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
}
