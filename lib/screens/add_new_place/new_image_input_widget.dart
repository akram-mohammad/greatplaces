import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        Padding(
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
                  child: Text(
                    'No Image to Preview',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.camera),
                label: Text('Add an Image'),
              )
            ],
          ),
        )
      ],
    );
  }
}
