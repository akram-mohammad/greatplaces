import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/screens/place_details_screen.dart';

class PlaceListTile extends StatelessWidget {
  final String id;
  final File image;
  final String title;
  final String address;
  PlaceListTile({this.image, this.title, this.address, this.id});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => PlaceDetailsScreen(
                      id: id,
                    )));
      },
      leading: CircleAvatar(
        backgroundImage: FileImage(image),
        radius: 22.0,
      ),
      title: Text(title),
      subtitle: Text(address.toString()),
    );
  }
}
