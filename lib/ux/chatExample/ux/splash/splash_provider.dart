import 'package:examples/ux/chatExample/domain/repository/conatct_application_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/ux/provider.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider({
    required this.localStrorageRepositoryInterface,
    required this.contactRepositoryInterface,
    required this.userRepositoryInterface,
    required this.chatProvider,
  });
  final LocalStrorageRepositoryInterface localStrorageRepositoryInterface;
  final ContactNativeRepositoryInterface contactRepositoryInterface;
  final UserRepositoryInterface userRepositoryInterface;
  final ChatProvider chatProvider;

  Future<String> init() async {
    String? token = await localStrorageRepositoryInterface.getToken();
    if (token != null) {
      await contactRepositoryInterface.askPermissions();
      await chatProvider.getContacts();
      await chatProvider.getContactsApplication();
      userRepositoryInterface.getChats(
        await localStrorageRepositoryInterface.getPhone(),
      );
      return 'user login';
    } else if (await localStrorageRepositoryInterface.getPhone() != null) {
      return 'phone register';
    }
    return 'phone not register';
  }
}
