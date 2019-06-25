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
  Future<dynamic> setPassangerLoginSharedPreference(data) async {
    final prefs = await SharedPreferences.getInstance();

    //Write
    prefs.setString("u_id", data["u_id"]);
    prefs.setString("name", data["name"]);
    prefs.setString("phone", data["phone"]);
    prefs.setString("current_loc", data["current_loc"]);
    prefs.setString("gender", data["gender"]);
    prefs.setString("review_id", data["review_id"]);
  }

  Future<String> getPreferenceUserId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("u_id");
  }

  Future<String> getPreferenceName() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("name");
  }

  Future<String> getPreferencePhone() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("phone");
  }

  Future<String> getPreferenceCurrentLocaction() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("current_loc");
  }

  Future<String> getPreferenceGender() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("gender");
  }

  Future<String> getPreferenceReviewId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("review_id");
  }

  Future<String> setDriverLoginSharedPreference(data) async {
    final prefs = await SharedPreferences.getInstance();

    //Write
    prefs.setString("d_id", data["d_id"]);
    prefs.setString("name", data["name"]);
    prefs.setString("phone", data["phone"]);
    prefs.setString("current_loc", data["current_loc"]);
    prefs.setString("taxi_id", data["taxi_id"]);
    prefs.setString("review_id", data["review_id"]);
  }

  Future<String> getPreferenceTaxiId() async{
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("taxi_id");
  }

  Future<String> getPreferenceDriverId() async{
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("d_id");
  }


}
