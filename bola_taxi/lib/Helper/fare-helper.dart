class FareHelper{

  double getFare(double distanceInMeters){

    //First 1 km 50rs 
    //After 1st km every 200 meter rs 8.80

    double totalFare = 0;

    if(distanceInMeters >= 1000){
      totalFare = 50;
      distanceInMeters -= 1000;
    }

    totalFare += distanceInMeters * 0.04;

    return totalFare;
  }

  _getDistanceInKM(int distanceInMeters){
    return distanceInMeters/1000;
  }

}