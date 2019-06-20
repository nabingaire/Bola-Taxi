import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {

  static HttpHelper _instance = new HttpHelper.internal();

  HttpHelper.internal();

  factory HttpHelper() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url, {Map<String, String> headers}) {
    return http
        .get(
      url,
      headers: headers,
    )
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":"+
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception( statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url,
      {Object body}) {
    return http
        .post(url, body: body)
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception( statusCode);
      }
      return _decoder.convert(res);
    });
  }
}