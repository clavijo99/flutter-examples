import 'package:examples/ux/chatExample/data/api.dart';
import 'package:examples/ux/chatExample/data/repositories/contact_application_repository_impl.dart';
import 'package:examples/ux/chatExample/data/repositories/contacts_repository_impl.dart';
import 'package:examples/ux/chatExample/data/repositories/local_storage_repository_impl.dart';
import 'package:examples/ux/chatExample/data/repositories/user_repository_impl.dart';
import 'package:examples/ux/chatExample/domain/repository/conatct_application_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/ux/provider.dart';
import 'package:examples/ux/chatExample/ux/socket_provider.dart';
import 'package:examples/ux/chatExample/ux/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatExampleMain extends StatelessWidget {
  const ChatExampleMain({super.key});

  @override
  Widget build(BuildContext context) {
    final SocketIoProvider socketIoProvider = SocketIoProvider();
    return MultiProvider(
      providers: [
        Provider<LocalStrorageRepositoryInterface>(
          create: (context) => LocalStorageRepositoryImplementation(),
        ),
        Provider<ContactNativeRepositoryInterface>(
          create: (context) => ContactsNativeRepositoryImplementation(),
        ),
        Provider<UserRepositoryInterface>(
          create: (context) => USerRepositoryImplementation(),
        ),
        Provider<ContactApplicaionRepositoryInterface>(
          create: (_) => ContactApplicationRepositoryImplementation(),
        ),
      ],
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => ChatProvider(
            contactRepositoryInterface:
                Provider.of<ContactNativeRepositoryInterface>(context,
                    listen: false),
            contactApplicaionRepositoryInterface:
                Provider.of<ContactApplicaionRepositoryInterface>(context,
                    listen: false)),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen.init(context),
        ),
      ),
    );
  }
}
