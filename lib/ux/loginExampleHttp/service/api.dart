import 'dart:convert';
import 'dart:io';

import 'package:examples/ux/loginExampleHttp/models/login.request.dart';
import 'package:examples/ux/loginExampleHttp/models/login.response.dart';
import 'package:examples/ux/loginExampleHttp/models/user.model.dart';
import 'package:http/http.dart' as http;

const String path = 'http://192.168.20.24:3001/user';

class Api {
  Future<LoginModelResponse?> login(LoginModelRequest data) async {
    LoginModelResponse? loginModelResponse;
    var url = '$path/login';
    //var url = 'http://192.168.1.77:3001/user/login';

    var response = await http.post(Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(data.toJson()));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['message'] == 'Credenciales correctas') {
        loginModelResponse = LoginModelResponse.fromJson(data['data']);
      }
    }
    return loginModelResponse;
  }

  Future<bool> cretateUser(UserModel userModel) async {
    var url = '$path/';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(userModel.toJson()),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['message'] == 'usuario creado') {
        return true;
      } else if ((data['message'] == 'usuario existente')) {
        return false;
      }
    }
    return false;
  }
}
