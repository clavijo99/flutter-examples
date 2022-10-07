import 'dart:convert';
import 'dart:io';

import 'package:examples/ux/chatExample/domain/entities/contac_entitie.dart';
import 'package:examples/ux/chatExample/domain/request/login_request.dart';
import 'package:examples/ux/chatExample/domain/request/user_request.dart';
import 'package:examples/ux/chatExample/domain/response/login_response.dart';
import 'package:examples/ux/chatExample/domain/response/user_response.dart';
import 'package:http/http.dart' as http;
import 'package:examples/ux/chatExample/domain/useCases/api.dart';

class ApiImplementation extends ApiInterface {
  final String path = "http://192.168.20.24:3000";

  @override
  Future<String?> createUser(UserResponse userResponse) async {
    var uri = '$path/user';
    String? token;
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(userResponse.toJson()),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      switch (data['message']) {
        case 'usuario create':
          token = data['token'];
          break;
        case 'usuario no existe':
          break;
      }
    }
    return token;
  }

  @override
  Future<UserRequest?> getuser(String phone) async {
    UserRequest? user;
    var uri = '$path/user/$phone';
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      switch (data['message']) {
        case 'usuario existente':
          user = UserRequest.fromJson(data['data']);
          break;
        case 'usuario no existe':
          break;
      }
    }
    return user;
  }

  @override
  Future<LoginRequest?> login(LoginResponse loginResponse) async {
    LoginRequest? userRequest;
    var uri = '$path/user/login';
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(loginResponse.toJson()),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      switch (data['message']) {
        case 'login':
          userRequest = LoginRequest.fromJson(data['data']);
          break;
        case 'usuario no existe':
          break;
      }
    }
    return userRequest;
  }

  @override
  Future<void> getChat(String? phone) async {
    print(phone);
    var uri = '$path/chat/$phone';
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    }
  }

  @override
  Future<void> getContactApplication(List<ContactEntitie> contacts) async {
    var uri = '$path/contact/';
    Map<String, dynamic> args = {"contacts": contacts};
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(args),
    );

    print(jsonDecode(response.body));
  }
}
