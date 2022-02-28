import 'package:flutter/material.dart';
import '../constants/constant.dart';

class TextFieldDesign extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isNormal;
  final bool isName;
  const TextFieldDesign({
    required this.hint,
    Key? key,
    required this.controller,
    required this.isNormal,
    required this.isName,
  }) : super(key: key);

  @override
  State<TextFieldDesign> createState() => _TextFieldDesignState();
}

class _TextFieldDesignState extends State<TextFieldDesign> {
  bool _hidepass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isNormal
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    _hidepass = !_hidepass;
                  });
                },
                icon: Icon(
                  _hidepass ? Icons.visibility_off : Icons.visibility,
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
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.isNormal
              ? widget.isName
                  ? Icons.abc
                  : Icons.email
              : Icons.lock,
          color: kprimaryColor,
        ),
      ),
      obscureText: widget.isNormal ? false : _hidepass,
      // validator: (value) {},
      onChanged: (value) {},
    );
  }
}
