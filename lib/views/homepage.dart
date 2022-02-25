// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final dynamic data;
  const HomePage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [],
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            Text("ok"),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          // icon: SvgPicture.asset("assets\icons\menu.svg"),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/');
          },
        ),
      ),
    );
  }
}
