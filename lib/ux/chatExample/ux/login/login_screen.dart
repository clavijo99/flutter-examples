import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/domain/request/user_request.dart';
import 'package:examples/ux/chatExample/ux/chats/chats_screen.dart';
import 'package:examples/ux/chatExample/ux/create_user/create_user_screen.dart';
import 'package:examples/ux/chatExample/ux/layout/layout_screen.dart';
import 'package:examples/ux/chatExample/ux/login/login_provider.dart';
import 'package:examples/ux/chatExample/ux/login/widget/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(
        localStrorageRepositoryInterface:
            Provider.of<LocalStrorageRepositoryInterface>(context,
                listen: false),
        userRepositoryInterface:
            Provider.of<UserRepositoryInterface>(context, listen: false),
      ),
      builder: (context, child) => const LoginScreen._(),
    );
  }

  //FocusScope.of(context).requestFocus(new FocusNode());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final LoginProvider bloc = Provider.of<LoginProvider>(context);

    void validate() async {
      UserRequest? user = await bloc.validate();
      if (user == null) {
        Future.delayed(const Duration(milliseconds: 1500), (() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CreateUserScreen.init(context)));
        }));
      }
      print(bloc.user);
    }

    void login() async {
      bool response = await bloc.login();
      if (response) {
        Future.delayed(const Duration(milliseconds: 1500), (() {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LayoutScreen.init(context)));
        }));
      } else {}
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0E0E10),
        body: Consumer<LoginProvider>(builder: (context, value, child) {
          print('user interface ${bloc.user}');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldCustom(
                hinText: '311 111 1111',
                textEditingController: bloc.textEditingControllerPhone,
                icon: Icon(
                  Icons.phone_android,
                  color: (bloc.user != null) ? Colors.grey : Colors.white,
                ),
                inHabilidate: (bloc.user != null) ? true : false,
                onTap: () => (bloc.user != null)
                    ? FocusScope.of(context).requestFocus(FocusNode())
                    : null,
                typePassword: false,
              ),
              if (bloc.user != null)
                const SizedBox(
                  height: 30,
                ),
              if (bloc.user != null)
                TextFieldCustom(
                  hinText: 'Password',
                  icon: const Icon(
                    Icons.password_rounded,
                    color: Colors.white,
                  ),
                  onTap: () {},
                  inHabilidate: false,
                  textEditingController: bloc.textEditingControllerPassword,
                  typePassword: true,
                ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => (bloc.user != null) ? login() : validate(),
                  child: Container(
                    width: size.width,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFF151718),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: Text(
                      (bloc.user != null) ? 'Ingresar' : 'Registar',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
