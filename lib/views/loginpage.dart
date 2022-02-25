import 'package:ecommercergb/constants/constant.dart';
import 'package:ecommercergb/modals/user.dart';
import 'package:ecommercergb/modals/userdata.dart';
import 'package:ecommercergb/service/server.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final Future? post;
  const LoginPage({Key? key, this.post}) : super(key: key);
  static TextEditingController userController = TextEditingController();
  static TextEditingController passController = TextEditingController();

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
                      controller: userController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      // validator: (value) {},
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      controller: passController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        print(userController.text);
                        try {
                          LoginUser newUser = LoginUser(
                              email: userController.text,
                              password: passController.text);
                          // await postUser(ecommerceApi + "login",
                          //     body: newUser.toMap());
                          Welcome p = await (postUser(
                            ecommerceApi + "login",
                            body: newUser.toMap(),
                          ));
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          print(p.token.toString());
                          await prefs.setString('token', p.token.toString());
                          Navigator.of(context)
                              .pushNamed('/home', arguments: p);
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Colors.amber,
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text("Don't have account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/signup', arguments: null);
                          },
                          child: const Text('Sign Up'),
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
