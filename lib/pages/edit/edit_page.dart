import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  static String routeName = '/edit';
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _imagePicker = ImagePicker();
  File _file;

  Future<void> _tirarFoto(ImageSource source) async {
    var _pickedFile = await _imagePicker.getImage(
      source: source,
    );

    if (_pickedFile != null) {
      setState(() {
        _file = File(_pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edição',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            _file == null
                ? Text(
                    'Nenhuma foto encontrada',
                  )
                : FadeInImage(
                    image: FileImage(_file),
                    placeholder: AssetImage('assets/loading.gif'),
                  ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton.icon(
                    onPressed: () => _tirarFoto(
                      ImageSource.camera,
                    ),
                    icon: Icon(Icons.camera_alt),
                    label: Text('Tirar foto'),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: RaisedButton.icon(
                    onPressed: () => _tirarFoto(
                      ImageSource.gallery,
                    ),
                    icon: Icon(
                      Icons.photo_library,
                    ),
                    label: Text('Selecionar foto'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
