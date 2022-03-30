import 'package:ecommercergb/components/component.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController passconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                'to Ecommerce',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFieldDesign(
                        hint: "Name",
                        controller: nameController,
                        isNormal: true,
                        isName: true),
                    TextFieldDesign(
                        hint: "Email",
                        controller: emailController,
                        isNormal: true,
                        isName: false),
                    TextFieldDesign(
                        hint: "Password",
                        controller: passController,
                        isNormal: false,
                        isName: false),
                    TextFieldDesign(
                        hint: "Confirmation Password",
                        controller: passconController,
                        isNormal: false,
                        isName: false),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginButton(
                        nameController: nameController,
                        emailController: emailController,
                        passController: passController,
                        passconController: passconController,
                        path: "registration",
                        name: "Sign up"),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text("Already had account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('/');
                          },
                          child: const Text('Login'),
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
