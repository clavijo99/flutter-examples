import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/domain/response/user_response.dart';
import 'package:flutter/cupertino.dart';

class CreateUserProvider extends ChangeNotifier {
  CreateUserProvider({
    required this.contactRepositoryInterface,
    required this.localStrorageRepositoryInterface,
    required this.userRepositoryInterface,
  });
  final UserRepositoryInterface userRepositoryInterface;
  final LocalStrorageRepositoryInterface localStrorageRepositoryInterface;
  final ContactNativeRepositoryInterface contactRepositoryInterface;
  final TextEditingController editingControllerName = TextEditingController();
  final TextEditingController editingControllerpassword =
      TextEditingController();

  String? image;

  void setImage(String avatar) {
    image = avatar;
    notifyListeners();
  }

  Future<bool> create() async {
    UserResponse userRequest;
    String? token;
    String? phone = await localStrorageRepositoryInterface.getPhone();
    await localStrorageRepositoryInterface
        .setImage(image ?? 'assets/icons/avatar.png');
    localStrorageRepositoryInterface.setName(editingControllerName.text);
    userRequest = UserResponse(editingControllerName.text, phone!,
        editingControllerpassword.text, image ?? 'assets/icons/avatar.png');
    token = await userRepositoryInterface.createUser(userRequest);
    print('token --$token');
    if (token != null) {
      localStrorageRepositoryInterface.setToken(token);
      await contactRepositoryInterface.askPermissions();
      await contactRepositoryInterface.getContacts();
      await userRepositoryInterface.getChats(phone);
      return true;
    } else {
      return false;
    }
  }
}
