import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../service/service.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.passconController,
    required this.path,
    required this.name,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController passconController;
  final String path;
  final String name;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () async {
        try {
          var p = loginUser(nameController.text, emailController.text,
              passController.text, passconController.text, path);
          Navigator.of(context).popAndPushNamed('/home', arguments: p);
        } catch (e) {
          print(e);
        }
      },
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      color: kprimaryColor,
      child: Text(
        name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
