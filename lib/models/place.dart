import 'dart:io';

import 'package:flutter/foundation.dart';

class Place {
  final String id;
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

  factory Place.fromDatabase(Map<String, dynamic> json) {
    final place = PlaceLocation(
        longitude: json['loc_long'],
        latitude: json['loc_lat'],
        address: json['address']);
    return Place(
        id: json['id'],
        title: json['title'],
        image: File(
          json['image'],
        ),
        location: place);
  }
}

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String address;

  const PlaceLocation({
    @required this.longitude,
    @required this.latitude,
    this.address,
  });
}
