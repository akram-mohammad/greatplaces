import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function savePlace;
  ImageInput(this.savePlace);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _pickedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _pickedImage = File(imageFile.path);
    });
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = path.basename(imageFile.path);
    final savedImage =
        await _pickedImage.copy(path.join(appDocDir.path, appDocPath));
    widget.savePlace(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: Center(
              child: _pickedImage != null
                  ? Image.file(
                      _pickedImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Text(
                      'No Image to Preview',
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Add an Image'),
          )
        ],
      ),
    );
  }
}
