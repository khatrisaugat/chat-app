import 'dart:ffi';

import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  // const TextfieldWidget({Key? key}) : super(key: key);
  // ignore: use_key_in_widget_constructors
  const TextfieldWidget(this.hintText, this.obscureText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[600]!,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: TextFormField(
          obscureText: obscureText,
          autofocus: false,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          onChanged: (value) {},
          decoration: InputDecoration(
            // labelText: 'Your email',
            border: InputBorder.none,
            // floatingLabelStyle: TextStyle(
            //   color: Colors.black,
            //   fontSize: 15.0,
            // ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
