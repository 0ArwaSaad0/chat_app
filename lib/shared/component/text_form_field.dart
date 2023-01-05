import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  String? hintTex;
  TextInputType? textInputType;
  bool isVisible;

  String? messageValidator;
  String? regX;
  TextFormFields(
      {required this.hintTex,
      required this.textInputType,
      required this.isVisible,
      required this.messageValidator,
      this.regX});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text!.trim() == null) {
          return messageValidator;
        }
        final bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(text);
        if (!emailValid) {
          return regX;
        }
        else {
          return null;
        }
      },
      keyboardType: textInputType,
      obscureText: isVisible,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: hintTex,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
