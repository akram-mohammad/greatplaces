const GOOGLE_API_KEY = 'AIzaSyBR1lAJp3CH3G3h7yx4V1L-_EieqnwxFu4';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double longitude, double latitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
