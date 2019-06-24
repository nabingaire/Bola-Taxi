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
}
