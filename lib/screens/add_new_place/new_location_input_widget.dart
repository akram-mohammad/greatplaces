import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/add_new_place/map_screen.dart';
import 'package:location/location.dart';
import 'package:great_places/location/location_helper.dart';

class LocationInput extends StatefulWidget {
  final Function saveLocation;
  LocationInput(this.saveLocation);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  void saveLocation(lat, long) {
    final _locationUrlImage = LocationHelper.generateLocationPreviewImage(
        latitude: lat, longitude: long);
    setState(() {
      _previewImageUrl = _locationUrlImage;
    });
    widget.saveLocation(lat, long);
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      saveLocation(locData.latitude, locData.longitude);
    } catch (err) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final selectedLoc = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLoc == null) {
      return;
    }
    saveLocation(selectedLoc.latitude, selectedLoc.longitude);
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
                onPressed: _selectOnMap,
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
