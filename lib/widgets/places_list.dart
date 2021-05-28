import 'package:flutter/material.dart';
import 'package:great_places/widgets/place_tile.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (ctx, index) {
          return PlaceListTile();
        });
  }
}
