import 'package:flutter/material.dart';
import 'package:ecommercergb/views/view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => HomePage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupPage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
