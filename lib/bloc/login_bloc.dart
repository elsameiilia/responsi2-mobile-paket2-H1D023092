import 'dart:convert';
import 'package:responsi2_mobile_paket2_h1d023092/helpers/api.dart';
import 'package:responsi2_mobile_paket2_h1d023092/helpers/api_url.dart';
import 'package:responsi2_mobile_paket2_h1d023092/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;

    var body = {
      'email': email,
      'password': password,
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response);
    return Login.fromJson(jsonObj);
  }
}