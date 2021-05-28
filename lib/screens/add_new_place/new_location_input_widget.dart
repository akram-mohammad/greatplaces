import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:great_places/location/location_helper.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final _locationUrlImage = LocationHelper.generateLocationPreviewImage(
        latitude: locData.latitude, longitude: locData.longitude);
    setState(() {
      _previewImageUrl = _locationUrlImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Center(
              child: _previewImageUrl == null
                  ? Text('Select a Location to Preview')
                  : Image.network(
                      _previewImageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: _getCurrentUserLocation,
                icon: Icon(Icons.location_on),
                label: Text('Current Location'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text('Select on Map'),
              )
            ],
          )
        ],
      ),
    );
  }
}

// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
