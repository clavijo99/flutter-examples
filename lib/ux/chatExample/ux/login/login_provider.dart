import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/domain/request/login_request.dart';
import 'package:examples/ux/chatExample/domain/request/user_request.dart';
import 'package:examples/ux/chatExample/domain/response/login_response.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({
    required this.localStrorageRepositoryInterface,
    required this.userRepositoryInterface,
  });
  final LocalStrorageRepositoryInterface localStrorageRepositoryInterface;
  final UserRepositoryInterface userRepositoryInterface;

  final TextEditingController textEditingControllerPhone =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  UserRequest? user;
  bool obcureText = true;

  Future<UserRequest?> validate() async {
    String phone = textEditingControllerPhone.text;
    user = await userRepositoryInterface.getUser(phone);
    print('user  $user');
    if (user != null) {
      notifyListeners();
      return user;
    } else {
      localStrorageRepositoryInterface.setPhone(phone);
      notifyListeners();
      return null;
    }
  }

  Future<bool> login() async {
    LoginRequest? userRequest;
    LoginResponse loginResponse = LoginResponse(
        textEditingControllerPhone.text, textEditingControllerPassword.text);
    userRequest = await userRepositoryInterface.login(loginResponse);
    if (userRequest != null) {
      await localStrorageRepositoryInterface.setName(userRequest.name);
      await localStrorageRepositoryInterface.setPhone(userRequest.phone);
      await localStrorageRepositoryInterface.setImage(userRequest.image);
      await localStrorageRepositoryInterface.setToken(userRequest.token);
      return true;
    } else {
      return false;
    }
  }

  void obscureText() {
    obcureText = !obcureText;
    notifyListeners();
  }
}
