import 'package:ecommercergb/service/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant.dart';
import '../models/model.dart';

String? username;
Future<dynamic> loginUser(String name, String email, String password,
    String passcon, String addtoAPI) async {
  try {
    LoginUser newUser = LoginUser(
        name: name,
        email: email,
        password: password,
        passwordconfirmation: passcon);
    UserData p = await (postUser(
      ecommerceApi + addtoAPI,
      body: newUser.toMap(),
    ));
    username = p.user.name;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(p.token.toString());
    await prefs.setString('token', p.token.toString());
    return p;
  } catch (e) {
    print(e);
  }
  return username;
}
