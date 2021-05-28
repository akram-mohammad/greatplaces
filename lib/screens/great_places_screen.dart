import 'package:flutter/material.dart';
import 'package:great_places/widgets/places_list.dart';
import 'add_new_place/add_new_place.dart';

class GreatPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => AddNewPlace()));
            },
          )
        ],
      ),
      body: PlacesList(),
    );
  }
}
