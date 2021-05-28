import 'package:flutter/cupertino.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(Place place) {
    _items.add(place);
    notifyListeners();
  }
}
