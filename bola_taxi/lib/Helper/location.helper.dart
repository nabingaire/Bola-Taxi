import 'package:geocoder/geocoder.dart';

class LocationHelper {

  Future<String> getLocationNameFromLatLng(double latitude, double longitude)async{
    final coordinates = new Coordinates(latitude,longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var first = addresses.first;
    return "${first.featureName} : ${first.addressLine}";
  }

}
