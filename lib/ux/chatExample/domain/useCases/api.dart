import 'package:examples/ux/chatExample/domain/entities/contac_entitie.dart';
import 'package:examples/ux/chatExample/domain/request/login_request.dart';
import 'package:examples/ux/chatExample/domain/request/user_request.dart';
import 'package:examples/ux/chatExample/domain/response/login_response.dart';
import 'package:examples/ux/chatExample/domain/response/user_response.dart';

abstract class ApiInterface {
  Future<UserRequest?> getuser(String phone);
  Future<String?> createUser(UserResponse userResponse);
  Future<LoginRequest?> login(LoginResponse loginResponse);
  Future<void> getChat(String phone);
  Future<void> getContactApplication(List<ContactEntitie> contacts);
}
