import 'package:geocoder/geocoder.dart';

class LocationHelper {

  getLocationNameFromLatLng(latitude, longitude)async{
    final coordinates = new Coordinates(27.7089427,85.2560925);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var first = addresses.first;
    return "${first.featureName} : ${first.addressLine}";
  }

}
