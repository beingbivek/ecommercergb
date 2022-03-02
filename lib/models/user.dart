class LoginUser {
  final String? name;
  final String? email;
  final String? password;
  final String? passwordconfirmation;

  LoginUser({this.name, this.email, this.password, this.passwordconfirmation});

  factory LoginUser.fromJson(Map json) {
    return LoginUser(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      passwordconfirmation: json['password_confirmation'],
    );
  }

  Map toMap() {
    var map = {};
    map['name'] = name ?? "";
    map['email'] = email ?? "";
    map['password'] = password ?? "";
    map['password_confirmation'] = passwordconfirmation ?? "";

    return map;
  }
}
