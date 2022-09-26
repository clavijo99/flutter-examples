import 'package:examples/ux/loginExampleHttp/models/user.model.dart';
import 'package:examples/ux/loginExampleHttp/service/api.dart';
import 'package:examples/ux/loginExampleHttp/ux/login/login.screen.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/button.custom.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/message.alert.dialog.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/text.field.custom.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/text.field.password.custom.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final Api api = Api();
final TextEditingController nameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordContoller = TextEditingController();
final TextEditingController verifyPasswordController = TextEditingController();
bool invalidedButtton = true;
bool validedRegister = false;
late String message;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  void register() async {
    bool response;
    UserModel userModel = UserModel(
      name: nameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      address: addressController.text,
      email: emailController.text,
      password: passwordContoller.text,
    );
    response = await api.cretateUser(userModel);
    if (response) {
      message = 'Usuario creado';
    } else {
      message = 'usuario existente';
    }
    setState(() {
      validedRegister = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ValueChanged<String>? verifyPassword(String valor) {
      if (passwordContoller.text == valor) {
        setState(() {
          invalidedButtton = false;
        });
      } else {
        setState(() {
          invalidedButtton = true;
        });
      }
      return null;
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: validedRegister
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Column(
                        children: const [
                          SizedBox(height: 50),
                          Text(
                            "Hello Again!",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'AmiriQuran',
                            ),
                          ),
                          Text(
                            'Welcome back you\'ve',
                            style: TextStyle(
                                color: Color(0xFF5C586B), fontSize: 19),
                          ),
                          Text(
                            'been missed!',
                            style: TextStyle(
                                color: Color(0xFF5C586B), fontSize: 19),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFieldCustom(
                          hinText: 'Nombre', controller: nameController),
                      const SizedBox(height: 10),
                      TextFieldCustom(
                          hinText: 'Apellidos', controller: lastNameController),
                      const SizedBox(height: 10),
                      TextFieldCustom(
                          hinText: 'Telefono', controller: phoneController),
                      const SizedBox(height: 10),
                      TextFieldCustom(
                          hinText: 'Dirrecion', controller: addressController),
                      const SizedBox(height: 10),
                      TextFieldCustom(
                          hinText: 'Correo', controller: emailController),
                      const SizedBox(height: 10),
                      TextFieldPasswordCustom(
                        hinTExt: 'Contraseña',
                        controller: passwordContoller,
                      ),
                      const SizedBox(height: 10),
                      TextFieldPasswordCustom(
                          hinTExt: 'Verificar Contraseña',
                          controller: verifyPasswordController,
                          onChange: verifyPassword),
                      const SizedBox(height: 20),
                      ButtonCustom(
                          text: 'Registrar',
                          invalide: invalidedButtton,
                          onTap: () {
                            register();
                            Future.delayed(const Duration(milliseconds: 1500),
                                () {
                              setState(() {
                                validedRegister = false;
                              });
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()));
                            });
                          }),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'If you have an account? ',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                  color: Color(0xFF75A7E7),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  if (validedRegister)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 50,
                      child: AlertDialogCustom(message: message),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
