import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/widgets/place_tile.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<PlacesProvider>(context, listen: false).fetchData(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<PlacesProvider>(
                  child: Center(child: Text('No Places to Show')),
                  builder: (ctx, placeItem, ch) => placeItem.items.length <= 0
                      ? ch
                      : ListView.builder(
                          itemCount: placeItem.items.length,
                          itemBuilder: (ctx, index) {
                            return PlaceListTile(
                              title: placeItem.items[index].title,
                              image: placeItem.items[index].image,
                              address: placeItem.items[index].location.address,
                            );
                          },
                        ),
                ),
    );
  }
}
