import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:playgrnd/sections/ohareReader/pages/readerPage.dart';

class SelectTextFile {
  String _fileName;
  String _path;
  List<String> textList;
  String _extension = '.txt';
  FileType _pickingType;

  void openFileExplorer(BuildContext context) async {
    try {
      _path = await FilePicker.getFilePath(
          type: _pickingType, fileExtension: _extension);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    // if (!mounted) return;
    if (_path != null) {
      File(_path).readAsString().then((String contents) {
        _fileName = _path.split('/').last;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReaderPage(
              title: _fileName,
              text: contents,
            ),
          ),
        );
      });
    }
  }
}
