import 'package:flutter/services.dart';

class SharedPreferencesHelper{

  setInitialLoginSharedPreference(data ){

  const MethodChannel('plugins.flutter.io/shared_preferences')
  .setMockMethodCallHandler((MethodCall methodCall) async {

    //Get data map
    Map<String,dynamic> loginMap;

    loginMap["u_id"] = data["u_id"];
    loginMap["name"] = data["name"];
    loginMap["phone"] = data["phone"];
    loginMap["current_loc"] = data["current_loc"];
    loginMap["gender"] = data["gender"];
    loginMap["review_id"] = data["review_id"];

    if(data["taxi_id"]!=null){
      loginMap["taxi_id"] = data["taxi_id"];
    }

    if(data["u_id"]!=null){
      loginMap["u_id"] = data["u_id"];
    }

    if(data["d_id"]!=null){
      loginMap["d_id"] = data["d_id"];
    }

    if (methodCall.method == 'getAll') {
      return loginMap;// set initial values here if desired
    }
    return null;
  });

  }
}