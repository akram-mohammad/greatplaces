import 'dart:io';

import 'package:flutter/foundation.dart';

class Place {
  final DateTime id;
  final String title;
  final String desciption;
  final PlaceLocation location;
  final File image;

  Place(
      {@required this.id,
      @required this.title,
      this.desciption,
      @required this.location,
      @required this.image});
}

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String address;

  PlaceLocation({
    @required this.longitude,
    @required this.latitude,
    this.address,
  });
}
