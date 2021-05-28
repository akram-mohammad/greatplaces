import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:great_places/local_storage/db_helper.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    Place _newPlace = new Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null);
    _items.add(_newPlace);
    notifyListeners();
    Map<String, dynamic> data = {
      "id": _newPlace.id,
      "title": _newPlace.title,
      "image": _newPlace.image.path,
    };
    DBHelper.insert('places', data);
  }

  Future<void> fetchData() async {
    final _dataList = await DBHelper.getData('places');
    _items = _dataList.map((e) => Place().fromDatabase(e)).toList();
    notifyListeners();
  }
}
