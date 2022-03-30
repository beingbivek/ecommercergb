import 'package:ecommercergb/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../components/component.dart';

class LoginPage extends StatefulWidget {
  final Future? post;
  const LoginPage({Key? key, this.post}) : super(key: key);
  static TextEditingController userController = TextEditingController();
  static TextEditingController passController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: kbgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Ecommerce',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                'Log in',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFieldDesign(
                      isNormal: true,
                      hint: "Email",
                      controller: LoginPage.userController,
                      isName: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldDesign(
                      hint: "Password",
                      isName: false,
                      controller: LoginPage.passController,
                      isNormal: false,
                    ),
                    const SizedBox(
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    LoginButton(
                        nameController: TextEditingController.fromValue(null),
                        emailController: LoginPage.userController,
                        passController: LoginPage.passController,
                        passconController:
                            TextEditingController.fromValue(null),
                        path: "login",
                        name: "Log in"),
                    const SizedBox(
                      height: 100,
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 2,
                          padding: const EdgeInsets.all(15),
                          onPressed: () {},
                          child: Icon(
                            MdiIcons.facebook,
                            color: Colors.blue[900],
                            size: 35,
                          ),
                        ),
                        MaterialButton(
                          color: Colors.white,
                          shape: const CircleBorder(),
                          elevation: 2,
                          padding: const EdgeInsets.all(15),
                          onPressed: () {},
                          child: Icon(
                            MdiIcons.google,
                            color: Colors.grey[500],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('/signup');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
