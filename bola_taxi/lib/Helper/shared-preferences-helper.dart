import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

// {
//     "response_code": 200,
//     "message": "Login Successfull",
//     "u_id": "3",
//     "name": "asd",
//     "phone": "asd",
//     "current_loc": null,
//     "gender": "asd",
//     "review_id": null
// }

class SharedPreferencesHelper {
  setPassangerLoginSharedPreference(data) async {
    final prefs = await SharedPreferences.getInstance();

    //Write
    prefs.setString("u_id", data["u_id"]);
    prefs.setString("name", data["name"]);
    prefs.setString("phone", data["phone"]);
    prefs.setString("current_loc", data["current_loc"]);
    prefs.setString("gender", data["gender"]);
    prefs.setString("review_id", data["review_id"]);
  }

  getPreferenceUserId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("u_id");
  }

  getPreferenceName() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("name");
  }

  getPreferencePhone() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("phone");
  }

  getPreferenceCurrentLocaction() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("current_loc");
  }

  getPreferenceGender() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("gender");
  }

  getPreferenceReviewId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("review_id");
  }

  setDriverLoginSharedPreference(data) async {
    final prefs = await SharedPreferences.getInstance();

    //Write
    prefs.setString("d_id", data["d_id"]);
    prefs.setString("name", data["name"]);
    prefs.setString("phone", data["phone"]);
    prefs.setString("current_loc", data["current_loc"]);
    prefs.setString("taxi_id", data["taxi_id"]);
    prefs.setString("review_id", data["review_id"]);
  }

  getPreferenceTaxiId() async{
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("taxi_id");
  }

  getPreferenceDriverId() async{
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("d_id");
  }


}
