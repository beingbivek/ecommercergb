import 'package:ecommercergb/constants/constant.dart';
import 'package:ecommercergb/service/service.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  void dispose() {
    LoginPage.userController.dispose();
    LoginPage.passController.dispose();
    super.dispose();
  }

  bool _hidePass = true;
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
                    TextFormField(
                      controller: LoginPage.userController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kprimaryColor,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: kprimaryColor,
                        ),
                      ),
                      // validator: (value) {},
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: LoginPage.passController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePass = !_hidePass;
                            });
                          },
                          icon: Icon(
                            _hidePass ? Icons.visibility_off : Icons.visibility,
                            color: kprimaryColor,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kprimaryColor,
                            width: 2.0,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kprimaryColor,
                        ),
                        hintText: "Password",
                      ),
                      obscureText: _hidePass,
                      onChanged: (value) {},
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
                        userController: LoginPage.userController,
                        passController: LoginPage.passController),
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.userController,
    required this.passController,
  }) : super(key: key);

  final TextEditingController userController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () async {
        var p = loginUser(
            "", userController.text, passController.text, "", "login");
        Navigator.of(context).pushNamed('/home', arguments: p);
      },
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      color: kprimaryColor,
      child: const Text(
        'Log in',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
