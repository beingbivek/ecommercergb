import 'package:flutter/material.dart';

import '../service/service.dart';

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
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      // validator: (value) {
                      // user = value;
                      // },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      // validator: (value) {
                      //   user = value;
                      // },
                    ),
                    TextFormField(
                      controller: passController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      // validator: (value) {
                      //   user = value;
                      // },
                    ),
                    TextFormField(
                      controller: passconController,
                      decoration: const InputDecoration(
                          labelText: 'Confirmation Password'),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        var p = loginUser(
                            nameController.text,
                            emailController.text,
                            passController.text,
                            passconController.text,
                            "registration");
                        Navigator.of(context).pushNamed('/home', arguments: p);
                      },
                      color: Colors.amber,
                      child: const Text('SignUp'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text("Already had account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/', arguments: null);
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
