class ActiveRideModal{
  // {
  //     "origin": "Bhaktapur",
  //     "destination": "Kathmandu",
  //     "rider_name": "Raja Ram",
  //     "date": "1990/02/02",
  //     "taxi_no": "BA14PA"
  //   },

  final int index;
  final String origin;
  final String destination;
  final String phoneNumber;
  final String date;
  final String name;
  final String driverId;
  final String passangerId;

  ActiveRideModal(this.index,this.name,this.origin,this.destination,this.phoneNumber,this.date,this.driverId,this.passangerId);
}