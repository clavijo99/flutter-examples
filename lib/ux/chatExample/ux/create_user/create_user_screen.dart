import 'package:examples/ux/chatExample/data/avartars.dart';
import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/ux/create_user/create_user_provider.dart';
import 'package:examples/ux/chatExample/ux/layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateUserProvider(
        localStrorageRepositoryInterface:
            Provider.of<LocalStrorageRepositoryInterface>(context,
                listen: false),
        userRepositoryInterface:
            Provider.of<UserRepositoryInterface>(context, listen: false),
        contactRepositoryInterface:
            Provider.of<ContactNativeRepositoryInterface>(context,
                listen: false),
      ),
      builder: (context, child) => const CreateUserScreen._(),
    );
  }

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void create() async {
    final CreateUserProvider provider =
        Provider.of<CreateUserProvider>(context, listen: false);
    bool response = await provider.create();
    if (response) {
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => LayoutScreen.init(_)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CreateUserProvider bloc =
        Provider.of<CreateUserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF0E0E10),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Consumer<CreateUserProvider>(
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      animationController.forward();
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xFF151718), shape: BoxShape.circle),
                      child: (bloc.image != null)
                          ? Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Image.asset(
                                bloc.image!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 50,
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                TextFieldCustomCreateUser(
                  hinText: 'name',
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  typePassword: false,
                  textEditingController: bloc.editingControllerName,
                ),
                const SizedBox(height: 10),
                TextFieldCustomCreateUser(
                  hinText: 'password',
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  typePassword: true,
                  textEditingController: bloc.editingControllerpassword,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => create(),
                    child: Container(
                      width: size.width,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF151718),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Crear',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => Positioned(
              left: 0,
              right: 0,
              height: animationController.value * 120,
              bottom: 0,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      bloc.setImage(avatars[index]);
                      animationController.reverse();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF151718),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          avatars[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: avatars.length,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldCustomCreateUser extends StatefulWidget {
  const TextFieldCustomCreateUser({
    Key? key,
    required this.hinText,
    required this.icon,
    required this.typePassword,
    required this.textEditingController,
  }) : super(key: key);

  final String hinText;
  final Widget icon;
  final bool typePassword;
  final TextEditingController textEditingController;

  @override
  State<TextFieldCustomCreateUser> createState() =>
      _TextFieldCustomCreateUserState();
}

class _TextFieldCustomCreateUserState extends State<TextFieldCustomCreateUser> {
  bool oscureText = true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 60,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: const Color(0xFF151718),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hinText,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 19, horizontal: 1),
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                icon: widget.icon,
                suffixIcon: (widget.typePassword)
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            oscureText = !oscureText;
                          });
                        },
                        child: (oscureText)
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ))
                    : null),
            style: const TextStyle(color: Colors.white, fontSize: 19),
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            obscureText: (widget.typePassword) ? oscureText : false,
            controller: widget.textEditingController,
          ),
        ),
      ),
    );
  }
}
