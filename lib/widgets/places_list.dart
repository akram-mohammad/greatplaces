import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/widgets/place_tile.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlacesProvider>(
      child: Text('No Places to Show'),
      builder: (ctx, placeItem, ch) => placeItem == null
          ? ch
          : ListView.builder(
              itemCount: placeItem.items.length,
              itemBuilder: (ctx, index) {
                return PlaceListTile(
                  title: placeItem.items[index].title,
                  image: placeItem.items[index].image,
                );
              },
            ),
    );
  }
}
