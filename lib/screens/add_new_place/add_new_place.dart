import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/screens/add_new_place/new_image_input_widget.dart';
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
    Place _newPlace = new Place(
        id: DateTime.now(),
        title: textController,
        image: pickedImage,
        location: null);
    Provider.of<PlacesProvider>(context, listen: false).addPlace(_newPlace);
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
            child: Column(
              children: [
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      textController = val;
                    });
                  },
                ),
                ImageInput(savePlace),
              ],
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
