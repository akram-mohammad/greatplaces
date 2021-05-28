import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/screens/add_new_place/new_image_input_widget.dart';
import 'package:great_places/screens/add_new_place/new_location_input_widget.dart';
import 'package:provider/provider.dart';

class AddNewPlace extends StatefulWidget {
  @override
  _AddNewPlaceState createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends State<AddNewPlace> {
  File pickedImage;
  String textController = '';

  void savePlace(val) {
    setState(() {
      pickedImage = val;
    });
  }

  void _addPlace() {
    Provider.of<PlacesProvider>(context, listen: false)
        .addPlace(textController, pickedImage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 18.0, height: 1.5),
                        labelText: 'Title',
                        hintText: 'Enter Place Name ',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          textController = val;
                        });
                      },
                    ),
                  ),
                  ImageInput(savePlace),
                  LocationInput(),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (textController.isEmpty || pickedImage == null)
                ? null
                : _addPlace,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Add Place',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
        ],
      ),
    );
  }
}
