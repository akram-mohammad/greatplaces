import 'package:flutter/material.dart';
import 'package:great_places/screens/place_details_screen.dart';

class PlaceListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => PlaceDetailsScreen()));
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/images/TestImg.jpg',
        ),
        radius: 22.0,
      ),
      title: Text('Hello World'),
      subtitle: Text('This is the Address'),
    );
  }
}
