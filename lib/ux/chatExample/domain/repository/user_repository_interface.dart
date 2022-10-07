import 'package:examples/ux/chatExample/domain/request/login_request.dart';
import 'package:examples/ux/chatExample/domain/request/user_request.dart';
import 'package:examples/ux/chatExample/domain/response/login_response.dart';
import 'package:examples/ux/chatExample/domain/response/user_response.dart';

abstract class UserRepositoryInterface {
  Future<UserRequest?> getUser(String phone);
  Future<String?> createUser(UserResponse user);
  Future<LoginRequest?> login(LoginResponse loginResponse);
  Future<void> getChats(String? phone);
}
