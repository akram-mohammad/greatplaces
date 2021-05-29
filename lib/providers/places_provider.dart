import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:great_places/local_storage/db_helper.dart';
import 'package:great_places/location/location_helper.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlace(String title, File image, PlaceLocation place) async {
    final address =
        await LocationHelper.getPlaceAddress(place.latitude, place.longitude);
    final updatedLocation = PlaceLocation(
        longitude: place.longitude, latitude: place.latitude, address: address);
    Place _newPlace = new Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: updatedLocation);
    _items.add(_newPlace);
    notifyListeners();
    Map<String, dynamic> data = {
      "id": _newPlace.id,
      "title": _newPlace.title,
      "image": _newPlace.image.path,
      "loc_lat": _newPlace.location.latitude,
      "loc_long": _newPlace.location.longitude,
      "address": _newPlace.location.address
    };
    DBHelper.insert('places', data);
  }

  Future<void> fetchData() async {
    final _dataList = await DBHelper.getData('places');
    _items = _dataList.map((e) => Place.fromDatabase(e)).toList();
    notifyListeners();
  }
}
