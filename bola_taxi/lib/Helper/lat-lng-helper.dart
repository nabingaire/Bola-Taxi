class LatLngHelper{
  
  String latLng ="";
  List<String> latLngList =[];

  LatLngHelper(this.latLng){
    latLngList = _convertLatLngStringToList();
  }
  

  double getLongitude() {
    String lon = latLngList[1];
    return double.parse(lon);
  }

  double getLatitude() {
    String lat = latLngList[0];
    return double.parse(lat);
  }

  List<String> _convertLatLngStringToList() {
    return latLng.split(",");
  }


}