import 'package:examples/ux/chatExample/data/api.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/domain/request/login_request.dart';
import 'package:examples/ux/chatExample/domain/response/login_response.dart';
import 'package:examples/ux/chatExample/domain/response/user_response.dart';
import 'package:examples/ux/chatExample/domain/request/user_request.dart';

class USerRepositoryImplementation extends UserRepositoryInterface {
  final ApiImplementation apiImplementation = ApiImplementation();
  @override
  Future<String?> createUser(UserResponse user) async {
    return await apiImplementation.createUser(user);
  }

  @override
  Future<UserRequest?> getUser(String phone) async {
    return await apiImplementation.getuser(phone);
  }

  @override
  Future<LoginRequest?> login(LoginResponse loginResponse) async {
    return await apiImplementation.login(loginResponse);
  }

  @override
  Future<void> getChats(String? phone) async {
    apiImplementation.getChat(phone);
  }
}
