import 'package:examples/ux/loginExampleHttp/models/login.request.dart';
import 'package:examples/ux/loginExampleHttp/models/login.response.dart';
import 'package:examples/ux/loginExampleHttp/service/api.dart';
import 'package:examples/ux/loginExampleHttp/ux/home/home_screen.dart';
import 'package:examples/ux/loginExampleHttp/ux/register/register_scren.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/button.custom.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/message.alert.dialog.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/text.field.custom.dart';
import 'package:examples/ux/loginExampleHttp/ux/widgets/text.field.password.custom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool loginState = false;
bool loginVerify = false;
bool loginStateError = false;
bool loginStateProgress = false;
final Api api = Api();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
late LoginModelResponse? loginModelResponse;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void login() async {
      setState(() {
        loginState = true;
        loginStateProgress = true;
      });
      LoginModelRequest loginModelRequest = LoginModelRequest(
          email: emailController.text, password: passwordController.text);
      loginModelResponse = await api.login(loginModelRequest);
      if (loginModelResponse != null) {
        loginVerify = true;
      } else {
        loginVerify = false;
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD0D4E3),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: loginState
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
                    const SizedBox(height: 40),
                    Column(
                      children: const [
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
                          style:
                              TextStyle(color: Color(0xFF5C586B), fontSize: 19),
                        ),
                        Text(
                          'been missed!',
                          style:
                              TextStyle(color: Color(0xFF5C586B), fontSize: 19),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    TextFieldCustom(
                        hinText: 'Enter email', controller: emailController),
                    const SizedBox(height: 20),
                    TextFieldPasswordCustom(
                        hinTExt: 'Password', controller: passwordController),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Recovery Password",
                            style: TextStyle(
                              color: Color.fromARGB(255, 139, 147, 158),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ButtonCustom(
                        text: 'Sing In',
                        onTap: () async {
                          login();
                          Future.delayed(const Duration(milliseconds: 1500),
                              () {
                            if (loginVerify) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomeScreen()));
                            } else {
                              setState(() {
                                loginStateError = true;
                                loginStateProgress = false;
                              });
                              Future.delayed(const Duration(milliseconds: 1500),
                                  () {
                                setState(() {
                                  loginStateProgress = false;
                                  loginState = false;
                                  loginStateError = false;
                                });
                              });
                            }
                          });
                        }),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.withOpacity(0.01),
                                      Colors.grey.withOpacity(0.2),
                                      const Color(0xFF5C586B).withOpacity(0.2),
                                      const Color(0xFF5C586B)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Or continue with'),
                          ),
                          Expanded(
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.withOpacity(0.01),
                                      Colors.grey.withOpacity(0.2),
                                      const Color(0xFF5C586B).withOpacity(0.2),
                                      const Color(0xFF5C586B)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.topLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 65,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/icons/google.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/icons/apple-logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            width: 65,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/icons/facebook.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const RegisterScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Not a member? ',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Register now',
                            style: TextStyle(
                                color: Color(0xFF75A7E7),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                if (loginState == true)
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                if (loginStateProgress == true)
                  /*Positioned(
                    top: MediaQuery.of(context).size.height * 0.5 -
                        (MediaQuery.of(context).size.height * 0.2 / 2),
                    left: MediaQuery.of(context).size.width * 0.5 -
                        MediaQuery.of(context).size.height * 0.2 / 2,
                    right: MediaQuery.of(context).size.width * 0.5 -
                        MediaQuery.of(context).size.height * 0.2 / 2,
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(60),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),*/
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5 -
                        (MediaQuery.of(context).size.height * 0.2 / 2),
                    left: MediaQuery.of(context).size.width * 0.5 -
                        MediaQuery.of(context).size.height * 0.2 / 2,
                    right: MediaQuery.of(context).size.width * 0.5 -
                        MediaQuery.of(context).size.height * 0.2 / 2,
                    child: const Padding(
                      padding: EdgeInsets.all(60),
                      child:
                          CircularProgressIndicator(color: Color(0xFFFC6B68)),
                    ),
                  ),
                if (loginStateError)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 50,
                    child: AlertDialogCustom(
                        message: 'Los datos no son correctos'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
