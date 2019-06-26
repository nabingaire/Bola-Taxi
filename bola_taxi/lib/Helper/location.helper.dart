import 'package:geocoder/geocoder.dart';

class LocationHelper {

  Future<String> getLocationNameFromLatLng(latitude, longitude)async{
    final coordinates = new Coordinates(latitude,longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var first = addresses.first;
    return "${first.featureName} : ${first.addressLine}";
  }

}
